class Member < ActiveRecord::Base
  
  belongs_to :membership_level
  
  attr_accessible :name, :email, :billing_notes, :membership_level_id, :primary_industry
  
  def membership_level_name
    membership_level.name unless membership_level.nil?
  end
  
end
