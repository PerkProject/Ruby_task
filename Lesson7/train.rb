class Train
  include Manufacturer
  include Validator
  TYPE = { cargo: "грузовой", passenger: "пассажирский" }
  attr_accessor :route
  attr_reader   :speed, :number, :next_station, :cur_station, :prev_station, :carriage_list, :type

  NUMBER_FORMAT = /^[а-яА-ЯёЁa-zA-Z0-9]{3}[-]?[а-яА-ЯёЁa-zA-Z0-9]{2}$/
  @@trains_all = {}

  def initialize (number)
    @number = number
    @speed = 0
    @carriage_list = []
    @@trains_all[number] = self
    validate!
  end

  def take_block(&block)
    @carriage_list.each_with_index {|i, carriage| block.call(i, carriage)}
  end

  def self.find(number)
    @@trains_all[number]
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
    #puts "Нельзя прицеплять вагоны на скрости"
    #puts "Типы поезда и вагона не совпадают"
    add_carriage!(carriage) unless self.speed.zero? && carriage.type == self.type
  end

  def del_carriage(carriage)
    #puts "Нельзя отцеплять вагоны на скорости"
    #puts "У поезда #{self.number} нет такого вагона"
    del_carriage!(carriage) unless self.speed.zero? && @carriage_list.size.nonzero?
  end

  def take_route(route)
    @route = route
    @cur_station = 0
    @next_station = 1
    route.stations[cur_station].take_train(self)
    #puts "Маршрут построен"
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

  private
  #присвоение вагона идет в нутри метода
  def add_carriage!(carriage)
    self.carriage_list << carriage
  end
  #также удаление делаем внутри метода
  def del_carriage!(carriage)
    self.carriage_list.delete(carriage)
  end

  protected

  def validate!
    raise "Название поезда не может быть пустым" if number.nil?
    raise "Название поезда не может быть меньше 5 символов" if number.length < 5
    raise "Указан не правильный формат для названия поезда" if number !~ NUMBER_FORMAT
    true
  end
end
