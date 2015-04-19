Package {
  allow_virtual => true,
}

class {'hiera':
  hierarchy => [
    'clientcert/%{clientcert}',
    'puppet_role/%{puppet_role}',
    'global',
  ],
  datadir   => '/etc/puppet/environment/%{environment}/hiera',
}
