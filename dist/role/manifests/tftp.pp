# == Class: role::tftp
#
# TFTP Service
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class role::tftp {
  include profile::base  # All roles should have the base profile
  include profile::tftp
}
