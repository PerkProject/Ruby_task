class Route
  attr_reader :start_station , :finish_station
  def initialize (start_station, finish_station)
    @stations = []
    @start_station = start_station
    @finish_station = finish_station
  end

  def add_station(name)
    @stations << name
  end

  def del_station(name)
    @stations.delete(name)
  end

  def stations_list
   puts "#{@start_station}\n#{@stations.join("\n")}\n#{@finish_station}"
  end
end
