module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
    base.class_variable_set(:@@validations, {})
  end

  module ClassMethods
    def validate(attribute, validation_type, *params)
      class_variable_get(:@@validations)[[attribute, validation_type]] = *params
    end
  end

  module InstanceMethods
    include Validator
  end

  def validate!
      self.class.class_variable_get(:@@validations).each do |validation, params|
        value = instance_variable_get("@#{validation}")
        params.each { |validator, options| send(validator, attribute, value, *params) }
      end
    end

  def validate_presence(value)
    raise 'Атрибут не может быть пустым' if value.nil?
  end

  def validate_format(value, pattern)
    raise 'Не соотвествует формату' if value !~ pattern
  end

  def validate_type(value, type)
    raise 'Не верный тип' if value != type
  end
end
