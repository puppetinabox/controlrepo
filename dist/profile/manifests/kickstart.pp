# == Class: profile::kickstart
#
# kickstart webserver and files
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2016 Rob Nelson
#
class profile::kickstart {
  include ::apache

  $el7_packages = [
    '@core',
    'ntpdate',
    'ntp',
    'wget',
    'screen',
    'git',
    'perl',
    'openssh-clients',
    'open-vm-tools',
    'man',
    'mlocate',
    'bind-utils',
    'traceroute',
    'mailx',
  ]
  $post_fragments = [
    'community_kickstarts/install_puppet.erb',
    'profile/kickstart/clear_firewall.erb',
  ]

  ::community_kickstarts::centos7{'/var/www/html/centos7.ks':
    post_fragments => $post_fragments,
  }

  firewall { '100 HTTP/S inbound':
    dport  => [80, 443],
    proto  => tcp,
    action => accept,
  }
}
