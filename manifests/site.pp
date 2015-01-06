Package {
  allow_virtual => true,
}

node default {
  hiera_include('classes')
  $ssh_authorized_keys = hiera_hash('ssh_authorized_keys', undef)
  if ($ssh_authorized_keys != undef) {
    create_resources('ssh_authorized_key', $ssh_authorized_keys)
  }
}
