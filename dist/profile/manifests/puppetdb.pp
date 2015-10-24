# == Class: profile::puppetdb
#
# PuppetDB profile
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class profile::puppetdb {
  include ::puppetdb
  include ::puppetdb::master::config

  firewall {'100 PuppetDB Dashboard':
    dport  => 8080,
    proto  => tcp,
    action => accept,
  }
}
