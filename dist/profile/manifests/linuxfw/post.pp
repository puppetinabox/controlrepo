# == Class: linuxfw::post.pp
class profile::linuxfw::post {
  firewall { '998 input reject':
    proto   => 'all',
    action  => 'reject',
    reject  => 'icmp-host-prohibited',
    before  => undef,
  }
  firewall { '999 forward reject':
    proto   => 'all',
    chain   => 'FORWARD',
    action  => 'reject',
    reject  => 'icmp-host-prohibited',
    before  => undef,
  }
}
