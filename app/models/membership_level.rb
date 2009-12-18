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
end
