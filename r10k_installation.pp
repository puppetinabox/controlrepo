class { 'r10k':
  version => '1.4.0',
  sources => {
    'puppet' => {
      'remote'  => 'git@github.com:rnelson0/controlrepo-1.git',
      'basedir' => "${::settings::confdir}/environments",
      'prefix'  => false,
    },
    'hiera' => {
      'remote'  => 'git@github.com:rnelson0/hiera.git',
      'basedir' => "/etc/puppet/hiera",
      'prefix'  => false,
    }
  },
  manage_modulepath => false
}
