Given /^a member(?: named "([^\"]*)")?(?: with email "([^\"]*)")?(?: and billing notes "([^\"]*)")?(?: and primary_industry "([^\"]*)")?$/ do |name, email, billing_notes, primary_industry|
  Member.make(:name => name, :email => email, :billing_notes => billing_notes, :primary_industry => primary_industry)
end

Given /^a membership level called "([^\"]*)"$/ do |level_name|
  MembershipLevel.make(:name => level_name)
end

Given /^a Fulltime member named "([^\"]*)"$/ do |member_name|
  Member.make(:name => member_name, 
        :membership_level => MembershipLevel.find_or_create_by_name('Fulltime'))
end

Given /^a Lite member named "([^\"]*)"$/ do |member_name|
  Member.make(:name => member_name, 
        :membership_level => MembershipLevel.find_or_create_by_name('Lite'))
end
