require 'spec_helper'

def should_find_level_with_name(method_name, level_name)
  MembershipLevel.send(method_name).name.should == level_name
end

describe MembershipLevel do
  before(:each) do    
    @valid_attributes = {
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    MembershipLevel.create!(@valid_attributes)
  end
  
  describe "#fulltime" do
    describe "when it isn't in the database" do
      it "creates it and returns the Fulltime MembershipLevel" do
        should_find_level_with_name(:fulltime, 'Fulltime')
      end
    end
    
    describe "when it already exists in the database" do
      before { Factory(:membership_level, :name => 'Fulltime') }
      
      it "finds the existing Fulltime MembershipLevel" do
        should_find_level_with_name(:fulltime, 'Fulltime')
      end
      
      it "does not create a new Fulltime MembershipLevel in the DB" do
        should_find_level_with_name(:fulltime, 'Fulltime')
        MembershipLevel.count(:conditions => {:name => "Fulltime" }).should == 1
      end
    end
  end
  
  describe "#lite" do
    
    describe "when it isn't in the database" do
      it "creates it and returns the Lite MembershipLevel" do
        should_find_level_with_name(:lite, 'Lite')
      end
    end
    
    describe "when it already exists in the database" do
      before { Factory(:membership_level, :name => 'Lite') }
      
      it "finds the existing Lite MembershipLevel" do
        should_find_level_with_name(:lite, 'Lite')
      end
      
      it "does not create a new Lite MembershipLevel in the DB" do
        should_find_level_with_name(:lite, 'Lite')
        MembershipLevel.count(:conditions => {:name => "Lite" }).should == 1
      end
    end
    
  end
  
  describe "#basic" do
    it "does something" do
      pending
    end
  end
end
