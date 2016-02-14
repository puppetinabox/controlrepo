require 'spec_helper'

describe 'profile::puppet_master', :type => :class do
  let (:facts) do
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
      :puppetversion => '4.3.1',
      :concat_basedir => '/dne',
      :clientcert => 'puppet.example.com',
    }
  end 

  let (:pre_condition) {
    "package{'puppetdb': ensure => present, }"
  }

  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::puppet_master') }
    it { is_expected.to contain_class('epel') }
    it { is_expected.to contain_class('puppet') }

    # These resources are included based on hieradata
    it { is_expected.to contain_class('puppet::server') }
    it { is_expected.to contain_package('puppetserver').
      with_ensure('latest')
    }

    it { is_expected.to contain_class('hiera') }
    it { is_expected.to contain_class('r10k') }
    it { is_expected.to contain_class('r10k::webhook') }
    it { is_expected.to contain_class('r10k::webhook::config') }
    it { is_expected.to contain_firewall('110 zack-r10k web hook') }
    it { is_expected.to contain_cron('lab_config deploy') }
  end
end
