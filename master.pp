Package {
  allow_virtual => true,
}

include ::epel
Yumrepo<| |> -> Package <| |>


# https://github.com/puppetlabs/puppetlabs-puppetdb#upgrading-from-4x-to-version-5x
class { '::puppetdb::globals':
  version => '2.3.7-1.el6',
}
include '::puppetdb'

class { '::puppet::master':
  storeconfigs => true,
  environments => directory,
}
