require 'spec_helper'
describe 'profile::linuxfw', :type => :class do
  let :facts do
  {
    :kernel                 => 'Linux',
  }
  end

  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::linuxfw') }
    it { is_expected.to contain_class('profile::linuxfw::pre') }
    it { is_expected.to contain_class('profile::linuxfw::post') }
    it { is_expected.to contain_class('firewall') }
  end
end
