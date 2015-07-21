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
  include ::epel
  include ::puppet::master

  package { 'r10k':
    ensure   => '1.4.0',
    provider => gem
  }

  firewall { '100 allow agent checkins':
    dport  => 8140,
    proto  => tcp,
    action => accept,
  }
}
