class Route
  include Validator
  attr_reader :stations
  def initialize(start_station, finish_station)
    @stations = []
    @stations << start_station << finish_station
    validate!
  end

  def add_station(station_name)
    @stations.insert(-2, station_name)
  end

  def del_station(station_name)
    @stations.delete(station_name)
  end

  def stations_list
    @stations.each_with_index do |station, index|
      puts "#{station.station_name} #{index + 1}"
    end
  end

  protected

  def validate!
    raise 'Начальная станция не создана' unless check_start_station
    raise 'Конечная станция не создана' unless check_finish_station
    true
  end

  def check_start_station
    Station.all.include?(start_station)
  end

  def check_finish_station
    Station.all.include?(finish_station)
  end
end
