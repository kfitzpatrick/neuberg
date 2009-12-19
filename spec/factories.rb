# encoding: utf-8
require 'sham'
require 'faker'
require 'random_data'

# In Textmate use: http://github.com/drnic/ruby-machinist-tmbundle/
# Consider a BlogPost that has many BlogComments in a blog app. If you go to your blueprints.rb file, type "BlogPost" 
# and press "Cmd+B" the bundle will load up the BlogPost class, inspect it, and generate the following a blueprint.

# Shams
# We use faker to make up some test data

Sham.define do
  name                               { Faker::Name.name } 
  first_name                         { Faker::Name.first_name } 
  last_name                          { Faker::Name.last_name }
  login                              { Faker::Internet.user_name.gsub('.', '') }
  username                           { Faker::Internet.user_name.gsub('.', '') }
  email                              { Faker::Internet.email }
  company_name                       { Faker::Company.name } 
  title                              { Faker::Lorem.sentence }
  text                               { Faker::Lorem.paragraphs.join('\n\n') }
  body                               { Faker::Lorem.paragraphs.join('\n\n') }
#  picture                            { File.open Dir.glob(File.join(File.dirname(__FILE__), 'fixtures/*.jpg')).to_a.rand }
  time                               { DateTime.civil(1990 + rand(20), rand(12)+1, rand(28)+1, rand(24), rand(60), rand(60)) }
  date                               { Date.civil(1990 + rand(20), rand(12)+1, rand(28)+1) }
  percentage(:unique => false)       { rand(100) }
  price(:unique => false)            { BigDecimal.new("865.00") }
  corporate_identity_number          { ("%010d" % rand(10000000000)) }
  quantity(:unique => false)         { rand(10) + 1 }
  password(:unique => false)              { 'test1234' }
  bit(:unique => false) { rand(2) }
end


Factory.define :member do |f|
  f.name                { Sham.name }
  f.email               { Sham.email }
  f.billing_notes       { Sham.text }
  f.membership_level    { MembershipLevel.find_or_create_by_name('Basic') }
end

Factory.define :membership_level do |f|
  f.name { Sham.first_name }
end
