# encoding: utf-8

class ActiveRecord::Base
  
  def self.random
    random = rand(count)
    uncached do
      find(:first, :offset => random)
    end
  end
  
  def self.per_page(num=nil)
    @per_page = num if num
    @per_page || 10
  end
  
  def self.t(name)
    human_attribute_name(name.to_s)
  end
  
  # mostly for tests
  def save_and_reload
    save
    reload
  end
  
end
