class Train
  TYPE = [:"Грузовой", :"Пассижирский"].freeze
  attr_accessor :route
  attr_reader :carriage_qty, :type, :speed

  def initialize (number, type, carriage_qty)
    @number = number
    @type = type
    @carriage_qty = carriage_qty
    @cur_station = nil
    @route = nil
    @prev_station = nil
  end

  def go_speed(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def show_carrige_qty
    @carriage_qty
  end

  def add_carriage
    self.carriage_qty += 1 if @speed == 0
  end

  def del_carriage
    self.carriage_qty -= 1 if @speed == 0 && self.carriage_qty > 0
  end

  def take_route(route)
    @route = route
    @cur_station = @start_station
    self.station.take_train(self)
  end

private

  def go_to_next_station(name)
    @prev_station = @cur_station
    station = name
    @cur_station = name
    station.take_train(self)
    station.send_train(self)
  end

  def send_from_prev_station
    station = @cur_station
    station.send_train(self)
  end

end
