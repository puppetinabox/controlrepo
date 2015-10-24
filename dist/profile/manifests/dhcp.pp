# == Class: profile::dhcp
#
# DHCP service
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class profile::dhcp {
  # DHCP service and host reservations
  include ::dhcp::server
  $dhcp_server_subnets = hiera_hash('dhcp_server_subnets', undef)
  if ($dhcp_server_subnets) {
    create_resources('dhcp::server::subnet', $dhcp_server_subnets)
  }

  $dhcp_server_hosts = hiera_hash('dhcp_server_hosts', undef)
  if ($dhcp_server_hosts) {
    create_resources('dhcp::server::host', $dhcp_server_hosts)
  }

  firewall { '100 dhcp requests':
    sport  => [67, 68],
    dport  => [67, 68],
    proto  => udp,
    action => accept,
  }
}
