class Station
  include Validator
  attr_reader :station_name

  NUMBER_FORMAT = /^[а-яА-ЯёЁa-zA-Z0-9]+$/

  @stations_all = []

  def initialize(station_name)
    @station_name = station_name
    @trains = []
    @@stations_all << self
    validate!
  end

  def take_block
    @trains.each do |train|
      yeild(train)
    end
  end

  def self.all
    @@stations_all
  end

  def take_station_by_station_name(station_name)
    self if self.station_name == station_name
  end

  def take_train(train)
    @trains << train
  end

  def show_trains
    @trains.each do |train|
      puts "Номер: #{train.number}"
      puts "тип поезда: #{train.type}"
      puts "количество вагонов: #{train.carriage_list.size}"
    end
  end

  def show_trains_by_type(type)
    show_trains_by_type = []
    @trains.each do |train|
      show_trains_by_type << train.nubmer if train.type == type
    end
    puts show_trains_by_type
  end

  def send_train(train)
    puts 'Поезд уже уехал' unless @trains.include? train
    @trains.delete(train)
  end

  protected

  def validate!
    raise 'Название станции не может быть пустым' if station_name.nil?
    raise 'Название меньше 4 символов' if station_name.length < 4
    raise 'Название не соотвествует формату' if station_name !~ NUMBER_FORMAT
    true
  end
end
