Package {
  allow_virtual => true,
}

include ::epel
Yumrepo<| |> -> Package <| |>
include ::puppetdb
class { '::puppet::master':
  storeconfigs => true,
  environments => directory,
}
