# == Class: role::yumrepo
#
# Yum repo Server role
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class role::yumrepo {
  include profile::base  # All roles should have the base profile
  include profile::yumrepo

  $repodirs = hiera('repodirs')
  file { $repodirs:
    ensure => directory,
  }
  $yumrepos = hiera_hash('yumrepos', undef)
  if ($yumrepos != undef) {
    create_resources('::createrepo', $yumrepos, {require => File[$repodirs]} )
  }
}
