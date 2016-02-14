# == Class: role::kickstart
#
# Kickstart service role
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2016 Rob Nelson
#
class role::kickstart {
  include profile::base  # All roles should have the base profile
  include profile::kickstart
}
