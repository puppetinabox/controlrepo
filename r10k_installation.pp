Package {
  allow_virtual => true,
}

class { 'r10k':
  version           => '1.4.0',
  sources           => {
    'puppet' => {
      'remote'  => 'git@github.com:puppetinabox/controlrepo.git',
      'basedir' => "${::settings::confdir}/environments",
      'prefix'  => false,
    },
    'hiera'  => {
      'remote'  => 'git@github.com:puppetinabox/hiera.git',
      'basedir' => '/etc/puppet/hiera',
      'prefix'  => false,
    }
  },
  manage_modulepath => false
}
