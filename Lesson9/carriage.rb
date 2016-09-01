class Carriage
  include Manufacturer
  include Accessors
  include Validation
  include Validator
  attr_reader :carriage_number, :type

  NUMBER_FORMAT = /^[а-яА-ЯёЁa-zA-Z0-9]+$/

  def initialize(carriage_number)
    @carriage_number = carriage_number
    validate!
  end

  def take_carriage_by_number(carriage_number)
    self if self.carriage_number == carriage_number
  end

  #protected

  #def validate!
  #  raise 'Название вагона не может быть пустым' if carriage_number.nil?
  #  raise 'Название вагона меньше 6 символов' if carriage_number.length < 6
  #  raise 'Использован неправильный формат' if carriage_number !~ NUMBER_FORMAT
  #  true
  #end
end
