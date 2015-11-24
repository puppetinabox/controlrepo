require 'spec_helper'
describe 'profile::dhcp', :type => :class do
  let :facts do
    {
      :clientcert             => 'dhcp',
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
    it { is_expected.to create_class('profile::dhcp') }
    it { is_expected.to contain_package('dhcp') }
    it { is_expected.to contain_dhcp__server__subnet('10.0.0.0') }
    it { is_expected.to contain_dhcp__server__host('sample') }
  end
end
