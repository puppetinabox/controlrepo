# == Class: role::phpmyadmin
#
# phpMyAdmin Server role
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class role::phpmyadmin {
  include profile::base  # All roles should have the base profile
  include profile::apache
  include profile::phpmyadmin
}
