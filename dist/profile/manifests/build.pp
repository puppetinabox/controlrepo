# == Class: profile::build
#
# build profile
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class profile::build {
  package {['ruby-devel', 'gcc', 'rpm-build']:
    ensure => present,
  }
  package {'fpm':
    ensure   => present,
    provider => gem,
    require  => Package['ruby-devel'],
  }
  package {'rspec-puppet':
    ensure   => present,
    provider => gem,
  }
}
