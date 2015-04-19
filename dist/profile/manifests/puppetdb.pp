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
}
