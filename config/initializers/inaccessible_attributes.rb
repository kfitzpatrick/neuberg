# encoding: utf-8

ActiveRecord::Base.send(:attr_accessible, nil) 

if Rails.env.test? or Rails.env.development?

  module ActiveRecord
    class MassAssignmentError < StandardError; end
  end

  ActiveRecord::Base.class_eval do
    def log_protected_attribute_removal(*attributes)
      raise ActiveRecord::MassAssignmentError, "Can't mass-assign these protected attributes: #{attributes.join(', ')}"
    end
  end
end
