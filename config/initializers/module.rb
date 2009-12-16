# encoding: utf-8

class Module

  # A version of Rails' delegate method which enables the prefix and allow_nil
  def soft_delegate(*attrs)
    options = attrs.extract_options!
    options[:prefix] = true unless options.has_key?(:prefix)
    options[:allow_nil] = true unless options.has_key?(:allow_nil)
    attrs.push(options)
    delegate *attrs
  end
  
end
