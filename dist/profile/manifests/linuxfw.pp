# == Class: linuxfw
#
# Base linux firewall policy
#
# === Examples
#
#  include linuxfw
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class profile::linuxfw {
  resources { 'firewall':
    purge => true
  }

  Firewall {
    before  => Class['profile::linuxfw::post'],
    require => Class['profile::linuxfw::pre'],
  }

  include ::profile::linuxfw::pre, ::profile::linuxfw::post

  include ::firewall
}
