class MemberMetrics
  def total_count
    Member.count
  end
  
  def fulltime
    Member.count(:conditions => { :membership_level_id => MembershipLevel.fulltime.id })
  end
  
  def fulltime_active
    Member.count(:conditions => { :membership_level_id => MembershipLevel.fulltime.id,
                                  :dormant => false} )
  end
  
  def fulltime_dormant
    Member.count(:conditions => { :membership_level_id => MembershipLevel.fulltime.id,
                                  :dormant => true} )
  end
end
