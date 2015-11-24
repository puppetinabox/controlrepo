require 'spec_helper'
describe 'profile::linuxfw::pre', :type => :class do
  let :facts do
    {
      :kernel => 'Linux',
    }
  end

  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::linuxfw::pre') }
    it { is_expected.to contain_firewall('000 accept related established rules') }
    it { is_expected.to contain_firewall('001 accept all icmp') }
    it { is_expected.to contain_firewall('002 accept all to lo interface') }
    it { is_expected.to contain_firewall('003 accept ssh connections') }
  end
end
