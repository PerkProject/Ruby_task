module Manufacturer
  include Validator
  attr_reader :manufacturer_name

  NUMBER_FORMAT = /^[а-яА-ЯёЁa-zA-Z0-9]+$/

  def manufacturer(name)
    @manufacturer_name = name
    validate!
  end

  protected

  def validate!
    raise 'Название не может быть пустым' if name.nil?
    raise 'Название должно содержать не меньше 6 символов' if name.length < 6
    raise 'Неправильный формат названия' if name !~ NUMBER_FORMAT
    true
  end
end
