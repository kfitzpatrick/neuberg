require 'spec_helper'

describe Member do
  it "should create a new instance given valid attributes" do
    Member.make
  end
  
  describe "#membership_level_name" do
    it "tells you the member's level in a human readable format" do
      MembershipLevel.make(:name => "Basic")
      Member.make.membership_level_name.should_not be_blank
    end
  end
end
