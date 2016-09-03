class Train
  include Manufacturer
  include Accessors
  include Validation
  TYPE = { cargo: 'грузовой', passenger: 'пассажирский' }.freeze
  attr_accessor :route
  attr_reader   :speed, :number, :next_station, :cur_station
  attr_reader   :prev_station, :carriage_list, :type
  NUMBER_FORMAT = /^[а-яА-ЯёЁa-zA-Z0-9]{3}[-]?[а-яА-ЯёЁa-zA-Z0-9]{2}$/
  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT
  @trains_all = {}

  def initialize(number)
    @number = number
    @speed = 0
    @carriage_list = []
    @@trains_all[number] = self
    validate!
  end

  def take_block(block)
    @carriage_list.each_with_index(&block)
  end

  def self.find(number)
    @trains_all[number]
  end

  def take_train_by_number(number)
    self if self.number == number
  end

  def go_speed(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)
    add_carriage!(carriage) unless speed.zero? && carriage.type == type
  end

  def del_carriage(carriage)
    del_carriage!(carriage) unless speed.zero? && @carriage_list.size.nonzero?
  end

  def take_route(route)
    @route = route
    @cur_station = 0
    @next_station = 1
    route.stations[cur_station].take_train(self)
  end

  def go_to_next_station
    if route
      route_move
      check_and_move_to_next_station
    else
      puts 'Маршрут не построен'
    end
  end

  def route_move
    route.stations[cur_station].send_train(self)
    @prev_station = cur_station
    @cur_station += 1
    @next_station += 1
  end

  def check_and_move_to_next_station
    if cur_station == route.stations.size - 1
      puts 'Маршрут окончен'
    else
      route.stations[next_station].take_train(self)
    end
  end

  def show_route
    show_prev_station
    puts "Текущая станция : #{route.stations[@cur_station].station_name}"
    show_next_station
  end

  def show_prev_station
    if @prev_station.nil?
      puts ''
    else
      puts "Проехали станцию : #{route.stations[@prev_station].station_name}"
    end
  end

  def show_next_station
    if @next_station <= route.stations.size - 1
      puts "Следующая станция : #{route.stations[@next_station].station_name}"
    else
      puts 'Поезд едет в депо'
    end
  end

  private

  def add_carriage!(carriage)
    carriage_list << carriage
  end

  def del_carriage!(carriage)
    carriage_list.delete(carriage)
  end
end
