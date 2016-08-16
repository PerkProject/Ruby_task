class Station
  attr_reader :name

 def initialize(name)
  @name = name
  @trains = []
 end

 def take_train(name)
  @trains << name
 end

 def show_trains
   @trains.join("\n")
 end

 def send_train(name)
   puts "Поезд уже уехал" unless @trains.include? name
   @trains.delete(name)
 end

end
