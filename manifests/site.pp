Package {
  allow_virtual => true,
}

node default {
  hiera_include('classes', [])
}
