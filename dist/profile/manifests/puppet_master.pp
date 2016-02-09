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
  include ::puppet

  include ::r10k
  include ::r10k::webhook::config
  include ::r10k::webhook
  Class['r10k::webhook::config'] -> Class['r10k::webhook']
  Package['puppetdb'] -> Service[webhook]

  # evenup/puppet includes a firewall rule for the puppetserver service
  firewall { '110 zack-r10k web hook':
    dport  => 8088,
    proto  => tcp,
    action => accept,
  }
}
