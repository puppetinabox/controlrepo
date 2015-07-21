# == Class: profile::rcfiles::bash
#
# Bash rcfiles
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class profile::rcfiles::bash {
  file { '/etc/bashrc.puppet':
    ensure  => file,
    path    => '/etc/bashrc.puppet',
    source  => 'puppet:///modules/profile/bashrc.puppet',
  }

  file_line {'bashrc_skel_puppet_source':
    ensure   => present,
    path     => '/etc/skel/.bashrc',
    line     => '[[ -f /etc/bashrc.puppet ]] && source /etc/bashrc.puppet',
    after    => '# .bashrc',
  }
}
