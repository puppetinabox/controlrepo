require 'spec_helper'
describe 'profile::rcfiles::vim', :type => :class do
  context 'with defaults for all parameters' do
    it { is_expected.to create_class('profile::rcfiles::vim') }

    it { is_expected.to contain_package('vim-enhanced') }
    it { is_expected.to contain_vcsrepo('/usr/share/vim/puppet') }
    it { is_expected.to contain_file_line('vimrc_runtimepath') }
    it { is_expected.to contain_file_line('vimrc_indent') }
    it { is_expected.to contain_file_line('vimrc_shiftwidth') }
  end
end
