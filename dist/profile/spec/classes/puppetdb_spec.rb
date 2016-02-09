require 'spec_helper'
describe 'profile::puppetdb', :type => :class do
  let :facts do
    {
      :kernel => 'Linux',
      :osfamily => 'RedHat',
      :operatingsystem => 'RedHat',
      :operatingsystemmajrelease => '7',
      :operatingsystemrelease => '7.2',
      :processors => {
        "count" => 2,
        "models" => ["Intel(R) Xeon(R) CPU E31220 @ 3.10GHz", "Intel(R) Xeon(R) CPU E31220 @ 3.10GHz"],
        "physicalcount" => 2
      },
      :puppetversion => '4.0.0',
      :concat_basedir => '/dne',
      :clientcert => 'puppet.example.com',
    }
  end

  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::puppetdb') }
    it { is_expected.to contain_class('puppetdb') }
    it { is_expected.to contain_class('puppetdb::master::config') }
    it { is_expected.to contain_firewall('100 PuppetDB Dashboard') }
  end
end
