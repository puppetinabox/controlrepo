Package {
  allow_virtual => true,
}

include ::epel
Yumrepo<| |> -> Package <| |>

class { '::puppet':
  server => true,
  server_version => latest,
  dns_alt_names => [
    'puppet',
  ],
  puppetdb_server => 'puppet.example.com',
  manage_puppetdb => false,
  manage_hiera => false,
  firewall => true,
  runmode => service,
}
