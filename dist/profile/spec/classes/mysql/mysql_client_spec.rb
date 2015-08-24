require 'spec_helper'
describe 'profile::mysql::client', :type => :class do
  let :facts do {
    :osfamily               => 'RedHat',
    :operatingsystem        => 'RedHat',
    :operatingsystemrelease => '6',
  }
  end

  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::mysql::client') }
    it { is_expected.to contain_class('mysql::client') }
  end
end
