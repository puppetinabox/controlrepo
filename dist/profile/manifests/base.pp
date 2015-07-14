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
  include ::ssh::server
  include ::ssh::client

  include ::ntp

  # Add ssh_authorized_key
  $ssh_authorized_keys = hiera_hash('ssh_authorized_keys', undef)
  if ($ssh_authorized_keys != undef) {
    create_resources('ssh_authorized_key', $ssh_authorized_keys)
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
