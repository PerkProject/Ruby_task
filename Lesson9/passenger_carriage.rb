class PassengerCarriage < Carriage
  attr_reader :busy_place_qty

  def initialize(carriage_number, place_qty)
    @carriage_number = carriage_number
    super(carriage_number)
    @type = :passenger
    @place_qty = place_qty.to_i
    @busy_place_qty = 0
  end

  def add_place
    @busy_place_qty += 1 if @busy_place_qty < @place_qty
  end

  def show_free_place
    @place_qty - @busy_place_qty
  end
end
