require 'spec_helper'
describe 'role' do

  context 'with defaults for all parameters' do
    it { should contain_class('role') }
  end
end
