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
    'db:populate:users'
  ]

  namespace :populate do

    task :setup => :environment do
      require File.join(Rails.root, 'spec', 'blueprints')
    end

    task :users => 'db:populate:setup' do
      puts "[populate] users"
      User.delete_all
      Populate.log User.make(:password => 'test1234', :password_confirmation => 'test1234', :email => "user@test.local").confirm_email!
    end
  end

end
