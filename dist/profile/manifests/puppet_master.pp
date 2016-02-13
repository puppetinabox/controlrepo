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

  # Deploy the configuration module on a regular basis
  cron {'lab_config deploy':
    ensure => present,
    command => 'r10k deploy module lab_config',
    minute => [0, 15, 30, 45],
  }

  # evenup/puppet includes a firewall rule for the puppetserver service
  firewall { '110 zack-r10k web hook':
    dport  => 8088,
    proto  => tcp,
    action => accept,
  }
}
