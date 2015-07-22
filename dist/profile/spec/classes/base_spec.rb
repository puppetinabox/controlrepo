require 'spec_helper'
describe 'profile::base', :type => :class do
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
    it { is_expected.to create_class('profile::linuxfw') }
    it { is_expected.to create_class('profile::base') }
    it { is_expected.to create_class('ntp') }
    it { is_expected.to create_class('ssh::server') }
    it { is_expected.to create_class('ssh::client') }
    it { is_expected.to create_local_user('padmin') }
  end
end
