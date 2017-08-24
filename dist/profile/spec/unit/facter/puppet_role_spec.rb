require 'spec_helper'
require 'facter/puppet_role'

describe 'custom fact puppet_role', :type => :fact do
  let (:hostname_fact) {
    self.class.description
  }
  before (:each) do
    Facter.fact(:hostname).stubs(:value).returns(hostname_fact)
    Facter.flush
  end
  subject { Facter.fact(:puppet_role).value }

  context "hostname 'loc-test72'" do
    before do
     Facter.fact(:hostname).stubs(:value).returns('loc-test72')
    end

    it "should return test" do
      expect(Facter.fact(:puppet_role).value).to eq('test')
    end
  end

  context "hostname 'test72'" do
    before do
     Facter.fact(:hostname).stubs(:value).returns('test72')
    end

    it "should return test" do
      expect(Facter.fact(:puppet_role).value).to eq('test')
    end
  end

  context "hostname 'role'" do
    before do
     Facter.fact(:hostname).stubs(:value).returns('role')
    end

    it "should return role" do
      expect(Facter.fact(:puppet_role).value).to eq('role')
    end
  end

  context "hostname '99luftballons'" do
    before do
     Facter.fact(:hostname).stubs(:value).returns('99luftballoons')
    end

    it "should return default" do
      expect(Facter.fact(:puppet_role).value).to eq('default')
    end
  end
end
