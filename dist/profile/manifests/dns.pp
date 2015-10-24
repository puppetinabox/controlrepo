# == Class: profile::dns
#
# SSH VPN Tunnel
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class profile::dns {
  # Named package and configs
  include ::bind
  $bind_server_confs = hiera_hash('bind_server_confs', undef)
  if ($bind_server_confs) {
    create_resources('bind::server::conf', $bind_server_confs)
  }
  $bind_server_files = hiera_hash('bind_server_files', undef)
  if ($bind_server_files) {
    create_resources('bind::server::file', $bind_server_files)
  }

  firewall { '100 DNS lookups':
    dport  => 53,
    proto  => udp,
    action => accept,
  }
}
