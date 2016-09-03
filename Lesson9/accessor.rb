module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*attributes)
      attributes.each do |attribute|
        attribute_name = "@#{attribute}".to_sym
        define_method(attribute.to_sym) { instance_variable_get(attribute_name) }
        define_method("#{attribute}=".to_sym) do |value|
          instance_variable_set(attribute_name, value)
          if @history[attribute_name]
            @history[attribute_name] << value
          else
            @history[attribute_name] = value
          end
        end
        define_method("#{attribute}_history") { instance_variable_get @history[attribute_name] }
      end
    end
  end

  def strong_attr_accessor(attribute_name, attribute_class)
    var_name = "@#{attribute_name}".to_sym
    define_method(attribute_name) { instance_variable_get(var_name) }
    define_method("@#{attribute_name}".to_sym) do |attribute|
      raise TypeError unless attribute.is_a?(attribute_class)
      instance_variable_set(var_name, attribute_class)
    end
  end
end
