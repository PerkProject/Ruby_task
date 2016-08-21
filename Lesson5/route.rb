class Route
  attr_reader :stations
  def initialize (start_station, finish_station)
    @stations = []
    @stations << start_station << finish_station
  end

  def add_station(station_name)
    @stations.insert(-2, station_name)
  end

  def del_station(station_name)
    @stations.delete(station_name)
  end

  def stations_list
    index = 0
   @stations.each_with_index  {|station, index| puts "#{station.station_name} #{index + 1}" }
  end
end
