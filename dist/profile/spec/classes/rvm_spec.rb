require 'spec_helper'
describe 'profile::rvm', :type => :class do
  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::rvm') }
    it { is_expected.to contain_rvm_system_ruby('ruby-1.9.3-p551') }
  end
end
