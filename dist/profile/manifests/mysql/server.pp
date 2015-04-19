# == Class: profile::mysql::server
#
# MySQL server
#
# === Authors
#
# Rob Nelson <rnelson0@gmail.com>
#
# === Copyright
#
# Copyright 2015 Rob Nelson
#
class profile::mysql::server {
  package {'policycoreutils-python':
    ensure => present,
  } ->
  exec {'set-mysql-selinux-context':
    command => '/usr/sbin/semanage fcontext -a -t mysqld_db_t "/data(/.*)?"',
    unless  => '/bin/ls /etc/selinux/targeted/contexts/files/file_contexts.local',
  } ->
  lvm::volume { 'lv_mysql':
    ensure => present,
    vg     => 'vg_mysql',
    pv     => '/dev/sda3',
    fstype => 'ext4',
    size   => '40G',
  } ->
  file {'/data':
    ensure  => directory,
  } ->
  mount {'/data':
    ensure  => 'mounted',
    name    => '/data',
    device  => '/dev/mapper/vg_mysql-lv_mysql',
    fstype  => 'ext4',
    options => 'defaults',
    atboot  => true,
  } ->
  file {'/data/mysql':
    ensure  => directory,
  } ->
  exec {'enforce-mysql-selinux-context':
    command => '/sbin/restorecon -R /data',
    unless  => '/bin/ls -ladZ /data/mysql/mysql | /bin/grep unconfined_u:object_r:mysqld_db_t',
  }

  include ::mysql::server
  include ::mysql::server::backup

  firewall { '100 MySQL inbound':
    dport  => 3306,
    proto  => tcp,
    action => accept,
  }

  Exec['enforce-mysql-selinux-context'] -> Service['mysqld']
}
