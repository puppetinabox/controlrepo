# == Class: profile::apache
#
# Apache profile
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class profile::apache {
  include ::apache

  firewall { '100 HTTP inbound':
    dport  => 80,
    proto  => tcp,
    action => accept,
  }
}
