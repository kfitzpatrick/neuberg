# encoding: utf-8

# lib/tasks/populate.rake

module Populate
  extend self
  
  def log(model)
    puts "[populate] created: <#{model.class} #{model.id}>"
  end
end

namespace :db do

  desc "Erase and fill database"
  task :populate => [
    'db:populate:members'
  ]

  namespace :populate do

    task :setup => :environment do
      require 'factory_girl'
      require File.join(Rails.root, 'spec', 'factories')
    end

    task :members => 'db:populate:setup' do
      puts "[populate members]"
      Member.delete_all
      puts "Cleared out all existing members"
      
      make_members(3)
      make_members(3, 'Lite')
      make_members(2, 'Fulltime')
      
      make_dormant_members(2, 'Basic')
      make_dormant_members(2, 'Lite')
    end
  end

end

def make_members(number_of, membership_level = 'Basic')
  create_a_member(number_of, membership_level, false)
end  

def make_dormant_members(number_of, membership_level = 'Basic')
  create_a_member(number_of, membership_level, true)
end

def create_a_member(number_of, membership_level = 'Basic', dormant = false)
  number_of.times do
    Populate.log Factory(:member, 
                    :membership_level => MembershipLevel.find_by_name(membership_level),
                    :dormant => dormant)
  end
end