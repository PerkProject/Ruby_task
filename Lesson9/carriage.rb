class Carriage
  include Manufacturer
  include Accessors
  include Validation
  attr_reader :carriage_number, :type
  validate :carriage_number, :presence

  NUMBER_FORMAT = /^[а-яА-ЯёЁa-zA-Z0-9]+$/

  def initialize(carriage_number)
    @carriage_number = carriage_number
    validate!
  end

  def take_carriage_by_number(carriage_number)
    self if self.carriage_number == carriage_number
  end
end
