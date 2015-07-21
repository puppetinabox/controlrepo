require 'spec_helper'
describe 'profile::rcfiles::bash', :type => :class do
  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::rcfiles::bash') }

    it { is_expected.to create_file('/etc/bashrc.puppet') }
    it { is_expected.to create_file_line('bashrc_skel_puppet_source') }
  end
end
