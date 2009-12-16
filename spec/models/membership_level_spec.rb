require 'spec_helper'

describe MembershipLevel do
  before(:each) do    
    @valid_attributes = {
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    MembershipLevel.create!(@valid_attributes)
  end
end
