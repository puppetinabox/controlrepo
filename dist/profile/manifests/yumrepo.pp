# == Class: profile::yumrepo
#
# Create a yum-compatible repo
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class profile::yumrepo (
  $vhost = 'yum.example.com',
  $repodirs,
) {
  include ::profile::apache

  file { $repodirs:
    ensure => directory,
  }

  $yumrepos = hiera_hash('profile::yumrepo::repos', undef)
  if ($yumrepos != undef) {
    create_resources('::createrepo', $yumrepos, {require => File[$repodirs]} )
  }

  apache::vhost {$vhost:
    docroot    => '/var/www/html/puppetrepo',
  }
}
