# == Class: profile::tftp
#
# TFTP service
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class profile::tftp {
  include ::tftp

  $tftp_files = hiera_hash('tftp::files', undef)
  if ($tftp_files) {
    create_resources('tftp::file', $tftp_files)
  }

  firewall { '100 tftp requests':
    dport  => 69,
    proto  => udp,
    action => accept,
  }
}
