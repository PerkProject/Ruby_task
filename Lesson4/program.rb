class Program
attr_reader :list_stations, :list_trains, :list_carriage

  def initialize
    @list_trains = []
    @list_stations = []
    @list_carriage = []
  end

  def program_features
    puts '1 - Создавать станции'
    puts '2 - Создавать поезда'
    puts '3 - Добавлять вагоны к поезду'
    puts '4 - Отцеплять вагоны от поезда'
    puts '5 - Помещать поезда на станцию'
    puts '6 - Посмотреть список станций'
    puts '7 - Посмотреть список поездов на станции'
    puts '8 - Список вагонов'
    puts '9 - выход из программы'
    puts ' '
    puts 'Введите цифру для того чтобы выбрать действие'
  end

  def features_go(feature_number)
    case feature_number
    when '1'
      puts 'Для того чтобы создать станцию'
      puts 'Введите название станции'
      station_name = gets.chomp
      create_station(station_name)
    when '2'
      puts 'Для того чтобы создать поезд'
      puts 'Введите номер поезда и его тип'
      puts 'Возможные типы: cargo/passenger'
      train_number = gets.chomp
      train_type = gets.chomp
      create_train(train_type, train_number)
    when '3'
      puts 'Для того чтобы добавить вагон к поезду'
      puts 'Введите номер поезда и номер вагона'
      train_number = gets.chomp
      carriage_number = gets.chomp
      carriage_to_train(train_number, carriage_number)
    when '4'
      puts 'Для того чтобы отцепить вагон от поезда'
      puts 'Введите номер поезда и номер вагона'
      train_number = gets.chomp
      carriage_number = gets.chomp
      carriage_out_train(train_number, carriage_number)
    when '5'
      puts 'Для того чтобы поместить поезд на станцию'
      puts 'Введите номер поезда и название станции'
      train_number = gets.chomp
      station_name = gets.chomp
      insert_train_to_station(train_number, station_name)
    when '6'
      puts 'Список станций: '
      show_stations_list
    when '7'
      puts 'Введите название станции'
      station_name = gets.chomp
      show_trains_by_stations(station_name)
    when '8'
      puts 'Список вагонов: '
      show_carriage
    when '9'
      puts 'Счастливого пути'
      exit
    else
      puts 'Неизвестная команда'
    end
  end

  def create_station(station_name)
    station = Station.new(station_name)
    list_stations << station
    puts 'Done'
  end

  def create_train(type, number)
    train = CargoTrain.new(number) if type == 'cargo'
    train = PassengerTrain.new(number) if type == 'passenger'
    list_trains << train
    puts 'Done'
  end

  def carriage_to_train(train_number, carriage_number)
     list_trains.each do |train|
      unless train.take_train_by_number(train_number).nil?
        if train.type == "cargo"
          carriage = CargoCarriage.new(carriage_number)
        else
          carriage = PassengerCarriage.new(carriage_number)
        end
        train.add_carriage(carriage)
        list_carriage << carriage
      end
      puts 'Done'
    end
  end

  def carriage_out_train(train_number, carriage_number)
     list_trains.each do |train|
      unless train.take_train_by_number(train_number).nil?
         list_carriage.each do |carriage|
          unless carriage.take_carriage_by_number(carriage_number).nil?
            train.del_carriage(carriage)
            list_carriage.delete(carriage)
          end
        end
      end
    end
  end

  def insert_train_to_station(train_number, station_name)
     list_stations.each do |station|
      unless station.take_station_by_station_name(station_name).nil?
         list_trains.each do |train|
          unless train.take_train_by_number(train_number).nil?
            station.take_train(train)
          end
        end
      end
    end
  end

  def show_stations_list
     list_stations.each do |station|
      puts "#{station.station_name}"
    end
  end

  def show_trains_by_stations(station_name)
     list_stations.each do |station|
      unless station.take_station_by_station_name(station_name).nil?
        station.show_trains
      end
    end
  end
  def show_carriage
    list_carriage.each do |carriage|
    puts "#{carriage.carriage_number}"
    end
  end
end
