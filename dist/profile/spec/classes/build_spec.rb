require 'spec_helper'
describe 'profile::build' do

  context 'with defaults for all parameters' do
    it { should create_class('profile::build') }
    it { should contain_package('fpm') }
  end
end
