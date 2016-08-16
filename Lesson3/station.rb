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

 def show_trains_by_type(type)
  show_trains_by_type = []
  self.trains.each do |train|
    show_trains_by_type << train if train.type == type
  end
  puts "С типом #{type} #{trains_by_type.size} поезд/а/ов"
 end

 def send_train(name)
   puts "Поезд уже уехал" unless @trains.include? name
   @trains.delete(name)
 end

end
