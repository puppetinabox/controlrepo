# == Class: profile::phpmyadmin
#
# phpMyAdmin service
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class profile::phpmyadmin (
  $cname            = 'phpmyadmin.nelson.va',
  $serveradmin      = 'rnelson0@gmail.com',
  $docroot          = '/usr/share/phpMyAdmin',
  $servers          = {},
) {

  # SELinux booleans
  $selbooleans = [
    'httpd_can_network_connect_db',
    'httpd_can_network_connect',
  ]
  selboolean { $selbooleans:
    value      => on,
    persistent => true,
  }

  include ::apache

  # Certificates are based on the cname
  certs::vhost { $cname:
    source_path => hiera('certs::vhost::source_path', 'undef'),
  }
  Certs::Vhost<| |> -> Apache::Vhost<| |>

  ::apache::vhost { $cname:
    port        => 443,
    docroot     => $docroot,
    ssl         => true,
    ssl_cert    => "/etc/ssl/certs/${cname}.crt",
    ssl_key     => "/etc/ssl/certs/${cname}.key",
    serveradmin => $serveradmin,
    directories => [
      {
        'path' => '/usr/share/phpMyAdmin/',
      },
    ],
  }
  include ::apache::mod::php

  include ::epel

  # Packages
  Yumrepo['epel'] -> Package<| |>
  $packages = ['phpMyAdmin']
  package { $packages:
    ensure  => latest,
  } ->
  file {'/etc/httpd/conf.d/phpMyAdmin.conf':
    ensure => absent,
    notify => Service['httpd'],
  }
  file {'/etc/phpMyAdmin':
    ensure => directory,
    mode   => '0755',
  }
  file {'config.inc.php':
    ensure  => file,
    path    => '/etc/phpMyAdmin/config.inc.php',
    mode    => '0644',
    require => Package['phpMyAdmin'],
    content => template('profile/phpmyadmin/config.inc.php.erb'),
  }
}
