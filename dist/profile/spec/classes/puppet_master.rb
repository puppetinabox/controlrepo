require 'spec_helper'
describe 'profile::puppet_master', :type => :class do
  let :facts do
    {
      :osfamily               => 'RedHat',
      :operatingsystemrelease => '6.5',
      :concat_basedir         => '/dne/',
    }
  end 

  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::puppet_master') }
    it { is_expected.to contain_package('mcollective-common') }
    it { is_expected.to contain_class('epel') }
    it { is_expected.to contain_class('r10k') }
    it { is_expected.to contain_class('r10k::webhook') }
    it { is_expected.to contain_class('r10k::webhook::config') }
    it { is_expected.to contain_firewall('100 allow agent checkins') }
    it { is_expected.to contain_firewall('110 zack-r10k web hook') }
  end
end
