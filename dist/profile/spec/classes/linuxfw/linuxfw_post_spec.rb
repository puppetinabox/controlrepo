require 'spec_helper'
describe 'profile::linuxfw::post', :type => :class do
  let :facts do
  {
    :kernel                 => 'Linux',
  }
  end

  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::linuxfw::post') }
    it { is_expected.to contain_firewall('998 input reject') }
    it { is_expected.to contain_firewall('999 forward reject') }
  end
end
