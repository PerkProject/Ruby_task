class Carriage
  attr_reader :carriage_number

  def initialize(carriage_number)
    @carriage_number = carriage_number
  end

  def take_carriage_by_number(carriage_number)
    self if self.carriage_number == carriage_number
  end
end
