require 'spec_helper'
describe 'profile::hiera', :type => :class do

  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::hiera') }
    it { is_expected.to create_package('hiera') }
    it { is_expected.to create_package('hiera-puppet') }
  end
end
