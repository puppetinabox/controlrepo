# == Class: role::build
#
# Role for nodes providing the service 'build'
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class role::build {
  include ::profile::base  # All roles should have the base profile
  include ::profile::build
  include ::profile::rvm
  include ::profile::rcfiles::vim
  include ::profile::rcfiles::bash
}
