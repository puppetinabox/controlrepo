require 'spec_helper'
describe 'profile::mysql::server', :type => :class do
  let :facts do {
    :clientcert             => 'mysql',
    :osfamily               => 'RedHat',
    :operatingsystem        => 'RedHat',
    :operatingsystemrelease => '6',
  } end

  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::mysql::server') }
    it { is_expected.to contain_package('policycoreutils-python') }
    it { is_expected.to contain_exec('set-mysql-selinux-context') }
    it { is_expected.to contain_lvm__volume('lv_mysql').with(
      :pv     => '/dev/sda3',
      :fstype => 'ext4',
      :size   => '40G'
    )}
    it { is_expected.to contain_file('/data').with(
      :ensure => 'directory'
    )}
    it { is_expected.to contain_mount('/data').with(
      :ensure => 'mounted',
      :name   => '/data',
      :device => '/dev/mapper/vg_mysql-lv_mysql',
      :fstype => 'ext4',
      :atboot => 'true',
    ) }
    it { is_expected.to contain_file('/data/mysql').with(
      :ensure => 'directory'
    )}
    it { is_expected.to contain_exec('enforce-mysql-selinux-context') }
    it { is_expected.to contain_class('mysql::server') }
    it { is_expected.to contain_class('mysql::server::backup') }
    it { is_expected.to contain_firewall('100 MySQL inbound').with(
      :dport  => '3306',
      :proto  => 'tcp',
      :action => 'accept'
    )}
    it { is_expected.to contain_mysql_user('someuser@localhost') }
    it { is_expected.to contain_mysql_grant('someuser@localhost/somedb.*') }
    it { is_expected.to contain_mysql_database('somedb').with(
      :charset => 'utf8'
    )}    
  end
end
