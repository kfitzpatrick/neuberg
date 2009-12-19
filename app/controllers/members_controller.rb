class MembersController < ApplicationController
  
  def new
    @member = Member.new
    @member.membership_level = MembershipLevel.find_by_name('Basic')
  end
  
  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to members_url
    end
  end
  
  def index
    @active_members = Member.active
    @dormant_members = Member.dormant
    
    @count_basic_active_members = 0
    @count_lite_active_members = 0
    @count_fulltime_active_members = 0
    @active_members.group_by(&:membership_level).each do |level, members|
      if level.name == 'Basic'
        @count_basic_active_members = members.count
      elsif level.name == 'Lite'
        @count_lite_active_members = members.count
      elsif level.name == 'Fulltime'
        @count_fulltime_active_members = members.count
      end
      
    end
    
    @count_basic_inactive_members = 0
    @count_lite_inactive_members = 0
    @count_fulltime_inactive_members = 0
    @dormant_members.group_by(&:membership_level).each do |level, members|
      if level.name == 'Basic'
        @count_basic_inactive_members = members.count 
      elsif level.name == 'Lite'
        @count_lite_inactive_members = members.count
      elsif level.name == 'Fulltime'
        @count_fulltime_inactive_members = members.count
      end
    end
    
    
  end
  
  def show
    @member = Member.find(params[:id])
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    @member.update_attributes(params[:member])
    redirect_to member_url(@member)
  end
end
