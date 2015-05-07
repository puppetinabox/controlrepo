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
) {
  class {'::profile::apache': }

  apache::vhost {$vhost:
    docroot    => '/var/www/html/puppetrepo',
  }
}
