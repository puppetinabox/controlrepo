file {'/etc/puppet/hiera':
  ensure => directory,
}
class {'hiera':
  hierarchy => [
    'puppet_role/%{puppet_role}',
    'clientcert/%{clientcert}',
    '%{environment}',
    'global',
  ],
  datadir => '/etc/puppet/hiera/data/',
}
