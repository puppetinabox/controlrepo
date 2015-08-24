require 'spec_helper'
describe 'profile::dns', :type => :class do
  let :facts do {
    :clientcert => 'dns',
  } end

  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::dns') }
    it { is_expected.to contain_package('bind') }
    it { is_expected.to contain_bind__server__conf('/etc/named.conf') }
    it { is_expected.to contain_bind__server__file('named.test') }
  end
end
