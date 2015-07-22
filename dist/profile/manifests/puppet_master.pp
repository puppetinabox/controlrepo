# == Class: profile::puppet_master
#
# Puppet Master profile
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class profile::puppet_master {
  package { 'mcollective-common':
    ensure => present,
  }
  include ::epel
  include ::puppet::master

  include ::r10k
  include ::r10k::webhook::config
  include ::r10k::webhook
  Package['mcollective-common'] -> Class['r10k::webhook']
  Class['r10k::webhook::config'] -> Class['r10k::webhook']

  firewall { '100 allow agent checkins':
    dport  => 8140,
    proto  => tcp,
    action => accept,
  }
  firewall { '110 zack-r10k web hook':
    dport  => 8088,
    proto  => tcp,
    action => accept,
  }
}
