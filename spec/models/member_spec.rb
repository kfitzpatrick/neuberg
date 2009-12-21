require 'spec_helper'

describe Member do
  it "should create a new instance given valid attributes" do
    Member.make
  end
  
  context "with 1 active and 1 dormant member" do
    before do
      @dormant_member = Factory(:member, :dormant => true)
      @active_member = Factory(:member, :dormant => false)
    end
  
    describe "self.active" do
      it "returns all the active members" do
        Member.active.should include(@active_member)
      end
    
      it "doesn't return dormant members" do
        Member.active.should_not include(@dormant_member)
      end
      
    end
  
    describe "self.dormant" do
      it "returns all the dormant members" do
        Member.dormant.should include(@dormant_member)
      end
      
      it "doesn't return active members" do
        Member.dormant.should_not include(@active_member)
      end
    end
  end
  
  describe "#membership_level_name" do
    it "tells you the member's level in a human readable format" do
      MembershipLevel.make(:name => "Basic")
      Member.make.membership_level_name.should_not be_blank
    end
  end
  
  describe "#metrics" do
    
    it "gives you an object with all the info you need about the current membership" do
      Member.metrics.class.should == MemberMetricsSnapshot
    end
    
    context "with a couple of members" do
      before { 2.times { Factory(:member) } }
      
      it "can tell you the total number of members" do
        Member.metrics.total_count.should == 2
      end
    end
    
  end
end
