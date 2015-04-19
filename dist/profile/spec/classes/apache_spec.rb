require 'spec_helper'
describe 'profile::apache', :type => :class do
  let :facts do
  {
    :id                     => 'root',
    :kernel                 => 'Linux',
    :osfamily               => 'RedHat',
    :operatingsystem        => 'RedHat',
    :operatingsystemrelease => '6',
    :concat_basedir         => '/dne',
    :path                   => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  }
  end

  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::apache') }
    it { is_expected.to contain_package('httpd') }
    it { is_expected.to contain_user("apache") }
  end
end
