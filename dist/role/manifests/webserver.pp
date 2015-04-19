# == Class: role::webserver
#
# Webserver role
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class role::webserver {
  include profile::base  # All roles should have the base profile
  include profile::apache
}
