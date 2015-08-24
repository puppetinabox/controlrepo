require 'spec_helper'
describe 'profile::yumrepo', :type => :class do
  let :facts do {
    :clientcert => 'yum',
    :id                     => 'root',
    :kernel                 => 'Linux',
    :osfamily               => 'RedHat',
    :operatingsystem        => 'RedHat',
    :operatingsystemrelease => '6',
    :concat_basedir         => '/dne',
    :path                   => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  } end

  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::yumrepo') }
    it { is_expected.to contain_file('/repodir') }
    it { is_expected.to contain_createrepo('testrepo') }
    it { is_expected.to contain_apache__vhost('yum.example.com') }
  end
end
