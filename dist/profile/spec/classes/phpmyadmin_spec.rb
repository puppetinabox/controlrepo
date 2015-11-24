require 'spec_helper'
describe 'profile::phpmyadmin', :type => :class do
  let :facts do
    {
      :clientcert             => 'phpmyadmin',
      :id                     => 'root',
      :kernel                 => 'Linux',
      :osfamily               => 'RedHat',
      :operatingsystem        => 'RedHat',
      :operatingsystemrelease => '6',
      :concat_basedir         => '/dne',
      :path                   => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    }
  end

  context 'with dbpass and cname' do
    it { is_expected.to create_class('profile::phpmyadmin') }
    it { is_expected.to contain_package('phpMyAdmin') }
    it { is_expected.to contain_selboolean('httpd_can_network_connect_db') }
    it { is_expected.to contain_selboolean('httpd_can_network_connect') }
    it { is_expected.to contain_certs__vhost('phpmyadmin.example.com') }
    it { is_expected.to contain_apache__vhost('phpmyadmin.example.com') }
    it { is_expected.to contain_class('apache::mod::php') }
    it { is_expected.to contain_file('/etc/httpd/conf.d/phpMyAdmin.conf').with({
      :ensure => 'absent'
    } ) }
    it { is_expected.to contain_file('/etc/phpMyAdmin').with({
      :ensure => 'directory',
      :mode => '0755'
    } ) }
    it { is_expected.to contain_file('config.inc.php').with({
      :mode => '0644'
    } ) }
  end
end
