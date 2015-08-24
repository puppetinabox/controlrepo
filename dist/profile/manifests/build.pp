# == Class: profile::build
#
# build profile
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class profile::build (
  $rvm_version = 'ruby-1.9.3-p511',
  $gems        = {},
) {
   
  package {['ruby-devel', 'gcc', 'rpm-build']:
    ensure => present,
  }

  if ($is_pe == true) {
    # Do nothing yet
  }
  else {
    include ::rvm
    rvm_system_ruby{ $rvm_version:
      ensure      => present,
      default_use => true,
    }
    if ($gems) {
      create_resources('rvm_gem', $gems, {
        ruby_version => $rvm_version,
        require      => Rvm_system_ruby[$rvm_version],
      })
    }
  }
}
