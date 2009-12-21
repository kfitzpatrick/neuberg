# == Schema Information
# Schema version: 20091218214208
#
# Table name: membership_levels
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class MembershipLevel < ActiveRecord::Base
  attr_accessible :name  
  
  class << self
    def fulltime
      find_or_create_by_name('Fulltime')
    end
  
    def lite
      find_or_create_by_name('Lite')
    end
    
    def basic
      find_or_create_by_name('Basic')
    end
  end
end
