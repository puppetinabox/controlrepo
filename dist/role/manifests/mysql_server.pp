# == Class: role::mysql_server
#
# MySQL Server role
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class role::mysql_server {
  include profile::base  # All roles should have the base profile
  include profile::mysql::server
  include profile::mysql::client
}
