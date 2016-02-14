require 'spec_helper'
describe 'profile::kickstart', :type => :class do
  let :facts do
  {
    :id                        => 'root',
    :kernel                    => 'Linux',
    :osfamily                  => 'RedHat',
    :operatingsystem           => 'RedHat',
    :operatingsystemrelease    => '7.2',
    :operatingsystemmajrelease => '7',
    :concat_basedir            => '/dne',
    :path                      => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  }
  end

  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::kickstart') }
    it { is_expected.to contain_class('apache') }
    it { is_expected.to contain_community_kickstarts__centos7('/var/www/html/centos7.ks') }
  end
end
