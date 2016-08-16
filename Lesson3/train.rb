class Train
  TYPE = [:"Грузовой", :"Пассижирский"].freeze
  attr_accessor :speed
  attr_reader :carriage_qty

  def initialize (number, type, carriage_qty)
    @number = number
    @type = type
    @carriage_qty = carriage_qty
  end

  def stop
    @speed = 0
  end

  def add_carriage
    self.carriage_qty += 1 if @speed == 0
  end

  def del_carriage
    self.carriage_qty -= 1 if @speed == 0 && self.carriage_qty > 0
  end


end
