class Station
  attr_reader :station_name

 def initialize(station_name)
  @station_name = station_name
  @trains = []
 end

 def take_train(train)
  @trains << train
 end

 def show_trains
   @trains.each do |train|
    puts train.number
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
   puts "Поезд уже уехал" unless @trains.include? train
   @trains.delete(train)
 end

end
