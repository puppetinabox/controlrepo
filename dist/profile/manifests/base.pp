# == Class: profile::base
#
# Base profile
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 5014 Rob Nelson
#
class profile::base {
  # Base firewall policy
  include ::profile::linuxfw

  # SSH server and client
  class { '::ssh::server':
    options => {
      'PermitRootLogin'          => 'yes',
      'Protocol'                 => '2',
      'SyslogFacility'           => 'AUTHPRIV',
      'PasswordAuthentication'   => 'yes',
      'GSSAPIAuthentication'     => 'yes',
      'GSSAPICleanupCredentials' => 'yes',
      'AcceptEnv'                => 'LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION LC_ALL LANGUAGE XMODIFIERS',
      'Subsystem'                => '      sftp    /usr/libexec/openssh/sftp-server',
      'Banner'                   => '/etc/issue.net',
      'RhostsRSAAuthentication'  => 'yes',
      'HostbasedAuthentication'  => 'yes',
    },
  }
  class { '::ssh::client':
    options => {
      'Host *' => {
        'SendEnv'                   => 'LANG LC_*',
        'HashKnownHosts'            => 'yes',
        'GSSAPIAuthentication'      => 'yes',
        'GSSAPIDelegateCredentials' => 'no',
        'HostbasedAuthentication'   => 'yes',
        'EnableSSHKeysign'          => 'yes',
      },
    },
  }

  class { '::ntp':
    servers => [ '0.pool.ntp.org', '2.centos.pool.ntp.org', '1.rhel.pool.ntp.org'],
  }

  # Yum repository
  # Enable when in use
  $yumrepo_url = hiera('yumrepo_url')
  yumrepo {'lab':
    descr    => 'Lab El 6.5 - x86_64',
    baseurl  => $yumrepo_url,
    enabled  => 0,
    gpgcheck => 0,
  }
  Yumrepo<| |> -> Package<| |>

  # Set up shosts.equiv for automated logins from known hosts
  exec {'shosts.equiv':
    command => '/bin/cat /etc/ssh/ssh_known_hosts | grep -v "^#" | awk \'{print $1}\' | sed -e \'s/,/\n/g\' > /etc/ssh/shosts.equiv',
    require => Class['ssh::knownhosts'],
  }

  # Local user setup
  include '::sudo'
  ::sudo::conf { 'wheel':
    priority => 10,
    content  => '%wheel     ALL=(ALL)       ALL',
  }

  $local_users = hiera('local_users', undef)
  if ($local_users != undef) {
    create_resources('local_user', $local_users)
  }
}
