module Validation
  def self.included(base)
    include Validator
    base.extend ClassMethods
    base.send :include, InstanceMethods
    base.class_variable_set(:@@validations, {})
  end

  module ClassMethods
    def validate(attribute, *params)
      class_variable_get(:@@validations)[attribute] = *params
    end
  end

  module InstanceMethods
    protected

    def validate!
      self.class.class_variable_get(:@@validations).each do |validation, params|
        value = instance_variable_get("@#{validation}")
        send("validate_#{params[0]}", value, *params[1, params.size])
      end
      true
    end

    def validate_presence(value)
      raise 'Атрибут не может быть пустым' if value.nil?
    end

    def validate_format(value, format)
      raise 'Не соотвествует формату' if value !~ format
    end

    def validate_type(value, type)
      raise 'Не верный тип' if value != type
    end
  end
end

# TEST
=begin
irb
load "./validator.rb"
load "./validation.rb"
load "./accessor.rb"
load "./station.rb"
st1 = Station.new("sttt")
st1.is_valid?
=end
