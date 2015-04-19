require 'spec_helper'
describe 'profile::tftp', :type => :class do
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
    it { is_expected.to create_class('profile::tftp') }
    it { is_expected.to contain_package('tftpd-hpa') }
    it { is_expected.to contain_tftp__file('pxelinux.0')}
    it { is_expected.to contain_firewall('100 tftp requests').with(
      :dport  => '69',
      :proto  => 'udp',
      :action => 'accept'
   )}
  end
end
