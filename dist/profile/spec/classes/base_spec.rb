require 'spec_helper'
describe 'profile::base', :type => :class do
  let :facts do
    {
      :id => 'root',
      :kernel => 'Linux',
      :osfamily => 'RedHat',
      :operatingsystem => 'RedHat',
      :operatingsystemrelease => '7.2',
      :operatingsystemmajrelease => '7',
      :concat_basedir => '/dne',
      :path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
      :puppetversion => '4.3.1',
      :sudoversion => '1.8.6p7',
    }
  end

  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::base') }
    it { is_expected.to contain_class('profile::linuxfw') }
    it { is_expected.to contain_class('ssh::server') }
    it { is_expected.to contain_class('ssh::client') }
    it { is_expected.to contain_class('ntp') }
    it { is_expected.to contain_ssh_authorized_key('testkey') }
    it { is_expected.to contain_yumrepo('lab') }
    it { is_expected.to contain_exec('shosts.equiv') }
    it { is_expected.to contain_class('sudo') }
    it { is_expected.to contain_sudo__conf('wheel') }
    it { is_expected.to contain_local_user('testuser') }
  end
end
