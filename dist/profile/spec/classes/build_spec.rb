require 'spec_helper'
describe 'profile::build' do
  let :facts do
    {
      :clientcert => 'build',
    }
  end

  context 'with defaults for all parameters' do
    let :facts do
      super().merge({
        :is_pe => false,
      })
    end

    it { should create_class('profile::build') }
    it { should contain_class('rvm') }
    it { should contain_rvm_system_ruby('ruby-1.9.3-p511') }
    it { should contain_rvm_gem('test').with({
      :require => "Rvm_system_ruby[ruby-1.9.3-p511]", 
    } ) }
  end

  context 'using puppet enterprise' do
    let :facts do
      super().merge({
	:is_pe => true,
      })
    end

    it { should_not contain_class('rvm') }
  end
end
