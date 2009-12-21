require 'spec_helper'

def a_basic_member(dormant=false)
  Factory(:member,
    :dormant => dormant,
    :membership_level => MembershipLevel.basic )
end

def a_lite_member(dormant=false)
  Factory(:member,
    :dormant => dormant,
    :membership_level => MembershipLevel.lite )
end

def a_fulltime_member(dormant=false)
  Factory(:member,
    :dormant => dormant,
    :membership_level => MembershipLevel.fulltime )
end

def give_me_active_lite_members(number)
  number.times { a_lite_member }
end

def give_me_inactive_lite_members(number)
  number.times { a_lite_member(true) }
end

def give_me_active_fulltime_members(number)
  number.times { a_fulltime_member }
end

def give_me_inactive_fulltime_members(number)
  number.times { a_fulltime_member(true) }
end

def give_me_active_basic_members(number)
  number.times { a_basic_member }
end

def give_me_inactive_basic_members(number)
  number.times { a_basic_member(true) }
end

describe MemberMetricsSnapshot do

  describe "#total_count" do
    context "with no members" do
      it "returns 0" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.total_count.should == 0 
      end
    end
    
    context "with active members" do
      before { give_me_active_lite_members(2) }
      it "returns the number of existing members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.total_count.should == 2
      end
    end
    
    context "with active & inactive members" do
      before do 
        give_me_active_lite_members(2) 
        give_me_inactive_fulltime_members(1)
      end
      it "returns the number of existing members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.total_count.should == 3
      end
    end
  end

  describe "#basic" do
    context "with no members" do
      it "returns 0" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.basic.should == 0
      end
    end

    context "with some members who aren't basic" do
      before { give_me_active_fulltime_members(2) }
      it "returns 0" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.basic.should == 0
      end
    end

    context "with all active members" do
      before { give_me_active_basic_members(2) }
      it "returns the count of only basic members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.basic.should == 2
      end
    end

    context "with all inactive members" do
      before do 
        give_me_inactive_basic_members(2)
      end
      it "returns the count of all basic members regardless of activity" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.basic.should == 2
      end
    end

    context "with a mix of active and inactive members" do
      before do 
        give_me_active_basic_members(2)
        give_me_inactive_basic_members(2)
      end
      it "returns the count of all fulltime members regardless of activity" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.basic.should == 4
      end
    end

  end

  describe "#basic_active" do
    context "with both fulltime & basic members" do
      before do
        give_me_active_basic_members(1)
        give_me_active_fulltime_members(2)
      end

      it "returns only basic members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.basic_active.should == 1
      end
    end

    context "with both active & inactive basic members" do
      before do
        give_me_active_basic_members(2)
        give_me_inactive_basic_members(1)
      end

      it "doesn't return inactive members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.basic_active.should == 2
      end
    end
  end

  describe "#basic_dormant" do
    context "with both fulltime & basic members" do
      before do
        give_me_inactive_basic_members(1)
        give_me_inactive_fulltime_members(2)
      end

      it "returns only fulltime members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.basic_dormant.should == 1
      end
    end

    context "with both active & inactive basic members" do
      before do
        give_me_active_basic_members(2)
        give_me_inactive_basic_members(1)
      end

      it "doesn't return active members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.basic_dormant.should == 1
      end
    end  
  end

  describe "#lite" do
    context "with no members" do
      it "returns 0" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.lite.should == 0
      end
    end
    
    context "with some members who aren't lite" do
      before { give_me_active_fulltime_members(2) }
      it "returns 0" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.lite.should == 0
      end
    end
    
    context "with all active members" do
      before { give_me_active_lite_members(2) }
      it "returns the count of only lite members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.lite.should == 2
      end
    end
    
    context "with all inactive members" do
      before do 
        give_me_inactive_lite_members(2)
      end
      it "returns the count of all lite members regardless of activity" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.lite.should == 2
      end
    end
        
    context "with a mix of active and inactive members" do
      before do 
        give_me_active_lite_members(2)
        give_me_inactive_lite_members(2)
      end
      it "returns the count of all fulltime members regardless of activity" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.lite.should == 4
      end
    end
    
  end
  
  describe "#lite_active" do
    context "with both fulltime & lite members" do
      before do
        give_me_active_lite_members(1)
        give_me_active_fulltime_members(2)
      end
    
      it "returns only lite members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.lite_active.should == 1
      end
    end
    
    context "with both active & inactive lite members" do
      before do
        give_me_active_lite_members(2)
        give_me_inactive_lite_members(1)
      end
      
      it "doesn't return inactive members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.lite_active.should == 2
      end
    end
  end
  
  describe "#lite_dormant" do
    context "with both fulltime & lite members" do
      before do
        give_me_inactive_lite_members(1)
        give_me_inactive_fulltime_members(2)
      end
    
      it "returns only fulltime members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.lite_dormant.should == 1
      end
    end
    
    context "with both active & inactive lite members" do
      before do
        give_me_active_lite_members(2)
        give_me_inactive_lite_members(1)
      end
      
      it "doesn't return active members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.lite_dormant.should == 1
      end
    end  
  end

  describe "#fulltime" do
    context "with no members" do
      it "returns 0" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.fulltime.should == 0
      end
    end
    
    context "with some members who aren't fulltime" do
      before { give_me_active_lite_members(2) }
      it "returns 0" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.fulltime.should == 0
      end
    end
    
    context "with all active members" do
      before { give_me_active_fulltime_members(2) }
      it "returns the count of only fulltime members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.fulltime.should == 2
      end
    end
    
    context "with all inactive members" do
      before do 
        give_me_inactive_fulltime_members(2)
      end
      it "returns the count of all fulltime members regardless of activity" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.fulltime.should == 2
      end
    end
    
    context "with a mix of active and inactive members" do
      before do 
        give_me_active_fulltime_members(2)
        give_me_inactive_fulltime_members(2)
      end
      it "returns the count of all fulltime members regardless of activity" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.fulltime.should == 4
      end
    end
  end

  describe "#fulltime_active" do
    context "with both fulltime & lite members" do
      before do
        give_me_active_lite_members(1)
        give_me_active_fulltime_members(2)
      end
    
      it "returns only fulltime members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.fulltime_active.should == 2
      end
    end
    
    context "with both active & inactive fulltime members" do
      before do
        give_me_active_fulltime_members(2)
        give_me_inactive_fulltime_members(1)
      end
      
      it "doesn't return inactive members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.fulltime_active.should == 2
      end
    end
  end
  
  describe "#fulltime_dormant" do
    context "with both fulltime & lite members" do
      before do
        give_me_inactive_lite_members(1)
        give_me_inactive_fulltime_members(2)
      end
    
      it "returns only fulltime members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.fulltime_dormant.should == 2
      end
    end
    
    context "with both active & inactive fulltime members" do
      before do
        give_me_active_fulltime_members(2)
        give_me_inactive_fulltime_members(1)
      end
      
      it "doesn't return active members" do
        @metrics = MemberMetricsSnapshot.new
        @metrics.fulltime_dormant.should == 1
      end
    end  
  end
end
