# == Class: profile::hiera
#
# Hiera profile
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class profile::hiera {
  package { ['hiera', 'hiera-puppet']:
    ensure => present,
  }
}
