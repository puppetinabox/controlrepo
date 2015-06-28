# == Class: profile::rcfiles::vim
#
# VIm rcfiles
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class profile::rcfiles::vim {
  package {'vim-enhanced':
    ensure   => present,
  } ->
  vcsrepo {'/usr/share/vim/puppet':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/rodjek/vim-puppet.git',
  } ->
  file_line {'vimrc_runtimepath':
    ensure   => present,
    path     => '/etc/vimrc',
    line     => 'set runtimepath+=/usr/share/vim/puppet',
    after    => 'set nocompatible',
  } ->
  file_line {'vimrc_indent':
    ensure   => present,
    path     => '/etc/vimrc',
    line     => 'filetype plugin indent on',
    after    => '/usr/share/vim/puppet',
  } ->
  file_line {'vimrc_shiftwidth':
    ensure => present,
    path   => '/etc/vimrc',
    line   => 'set shiftwidth=2',
    after  => 'filetype plugin indent on',
  }
}
