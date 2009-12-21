# == Schema Information
# Schema version: 20091218214208
#
# Table name: members
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  email               :string(255)
#  billing_notes       :text
#  created_at          :datetime
#  updated_at          :datetime
#  membership_level_id :integer
#  primary_industry    :string(255)
#

class Member < ActiveRecord::Base
  
  belongs_to :membership_level
  
  attr_accessible :name, :email, :billing_notes, :membership_level_id, 
                  :primary_industry, :dormant
  
  class << self
    def dormant
      all(:conditions => ['dormant = ?', true])
    end
  
    def active
      all(:conditions => ['dormant = ?', false])
    end

    def metrics
      MemberMetricsSnapshot.new
    end
  end
  
  def membership_level_name
    membership_level.name unless membership_level.nil?
  end
  
end
