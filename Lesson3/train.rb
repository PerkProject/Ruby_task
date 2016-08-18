class Train
  TYPE = {passenger: "Пассажирские", cargo: "Грузовые"}.freeze
  attr_accessor :route, :carriage_qty
  attr_reader   :type, :speed, :number, :next_station, :cur_station, :prev_station

  def initialize (number, type, carriage_qty)
    @number = number
    @type = type
    @carriage_qty = carriage_qty
    @speed = 0
  end

  def go_speed(speed)
    @speed += speed
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

  def take_route(route)
    @route = route
    @cur_station = 0
    @next_station = 1
    route.stations[cur_station].take_train(self)
    puts "Маршрут построен"
  end


  def go_to_next_station
   if self.route
    route.stations[cur_station].send_train(self)
    @prev_station = self.cur_station
    @cur_station += 1
    @next_station += 1
   if self.cur_station == self.route.stations.size - 1
    puts "Маршрут окончен"
   else
    route.stations[next_station].take_train(self)
   end
   else
    puts "Маршрут не построен"
   end
  end

  def show_route
   if @prev_station.nil?
      puts ""
   else
    puts "Проехали станцию : #{route.stations[@prev_station].station_name}"
   end
    puts "Текущая станция : #{route.stations[@cur_station].station_name}"
   if @next_station <= self.route.stations.size - 1
    puts "Следующая станция : #{route.stations[@next_station].station_name}"
   else
    puts "Поезд едет в депо"
   end
  end

end
