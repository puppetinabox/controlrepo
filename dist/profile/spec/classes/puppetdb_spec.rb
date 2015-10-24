require 'spec_helper'
describe 'profile::puppetdb', :type => :class do
  let :facts do {
    :osfamily               => 'RedHat',
    :concat_basedir         => '/dne',
    :kernel                 => 'Linux',
  } end

  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::puppetdb') }
    it { is_expected.to contain_class('puppetdb') }
    it { is_expected.to contain_class('puppetdb::master::config') }
    it { is_expected.to contain_firewall('100 PuppetDB Dashboard') }
  end
end
