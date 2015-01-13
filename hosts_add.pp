host { 'puppet.example.com':
  ensure       => 'present',
  host_aliases => ['puppet'],
  ip           => '10.0.0.5',
  target       => '/etc/hosts',
}
host { 'yum.example.com':
  ensure       => 'present',
  host_aliases => ['yum'],
  ip           => '10.0.0.252',
  target       => '/etc/hosts',
}
