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
    
    @member_metrics = Member.metrics
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
