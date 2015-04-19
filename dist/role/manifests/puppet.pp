# == Class: role::puppet
#
# Puppet Master role
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class role::puppet {
  include profile::base  # All roles should have the base profile
  include profile::puppet_master
  include profile::puppetdb
  include profile::hiera
}
