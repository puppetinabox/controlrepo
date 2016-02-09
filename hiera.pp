Package {
  allow_virtual => true,
}

class {'hiera':
  hierarchy => [
    'clientcert/%{clientcert}',
    'puppet_role/%{puppet_role}',
    'global',
  ],
  datadir   => '/etc/puppetlabs/code/environments/%{::environment}/hiera',
}
