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
    puts '3 - Создавать вагоны'
    puts '4 - Добавлять вагоны к поезду'
    puts '5 - Отцеплять вагоны от поезда'
    puts '6 - Помещать поезда на станцию'
    puts '7 - Посмотреть список станций'
    puts '8 - Посмотреть список поездов на станции'
    puts '9 - Список вагонов поезда'
    puts '10 - Занимать место в вагоне'
    puts '0 - выход из программы'
    puts ' '
    puts 'Введите цифру для того чтобы выбрать действие'
  end

  def features_go(feature_number)
    case feature_number
    when '1'
      pre_create_station
    when '2'
      pre_create_train
    when '3'
      pre_create_carriage
    when '4'
      puts 'Для того чтобы добавить вагон к поезду'
      puts 'Введите номер поезда и номер вагона'
      train_number = gets.chomp
      carriage_number = gets.chomp
      carriage_to_train(train_number, carriage_number)
    when '5'
      puts 'Для того чтобы отцепить вагон от поезда'
      puts 'Введите номер поезда и номер вагона'
      train_number = gets.chomp
      carriage_number = gets.chomp
      carriage_out_train(train_number, carriage_number)
    when '6'
      puts 'Для того чтобы поместить поезд на станцию'
      puts 'Введите номер поезда и название станции'
      train_number = gets.chomp
      station_name = gets.chomp
      insert_train_to_station(train_number, station_name)
    when '7'
      puts 'Список станций: '
      show_stations_list
    when '8'
      puts 'Введите название станции'
      station_name = gets.chomp
      show_trains_by_stations(station_name)
    when '9'
      puts 'Введите номер поезда'
      train_number = gets.chomp
      show_carriage_by_train(train_number)
    when '10'
      puts 'Укажите номер вагона'
      carriage_number = gets.chomp
      fill_carriage(carriage_number)
    when '0'
      puts 'Счастливого пути'
      exit
    else
      puts 'Неизвестная команда'
    end
  end

  private

  def pre_create_station
    create_station
  rescue StandardError => e
    puts e
    retry
  end

  def create_station
    puts 'Для того чтобы создать станцию'
    puts 'Введите название станции'
    station_name = gets.chomp
    station = Station.new(station_name)
    list_stations << station
    puts "Создана станция #{station_name}"
  end

  def pre_create_train
    create_train
  rescue StandardError => e
    puts e
    retry
  end

  def create_train
    puts 'Для того чтобы создать поезд'
    puts 'Введите номер поезда и его тип'
    puts 'Возможные типы: 1 - cargo / 2 - passenger'
    train_number = gets.chomp
    type = gets.chomp
    train = CargoTrain.new(train_number) if type == '1'
    train = PassengerTrain.new(train_number) if type == '2'
    list_trains << train
    puts "Создан поезд под номером #{train_number} с типом #{train.type}"
  end

  def pre_create_carriage
    puts 'Для того чтобы создать вагон'
    puts 'Введите его номер'
    carriage_number = gets.chomp
    puts 'Укажите тип вагона'
    puts '1 - пассажирский, 2 - грузовой'
    carriage_type = gets.chomp
    create_carriage(carriage_number, carriage_type)
  rescue StandardError => e
    puts e
    retry
  end

  def create_carriage(carriage_number, carriage_type)
    if carriage_type.to_i == 1
      puts 'Для создания пассажирского вагона укажите количество мест'
      place_qty = gets.chomp
      carriage = PassengerCarriage.new(carriage_number,place_qty)
    else
      puts 'Для создания грузового вагона укажите его объем'
      capacity_all = gets.chomp
      carriage = CargoCarriage.new(carriage_number,capacity_all)
    end
    list_carriage << carriage
    puts "Вагон под номером #{carriage_number} создан"
  end

  def carriage_to_train(train_number, carriage_number)
    list_trains.each do |train|
      unless train.take_train_by_number(train_number).nil?
        list_carriage.each do |carriage|
          unless carriage.take_carriage_by_number(carriage_number).nil?
            train.add_carriage(carriage)
          end
        end
      end
    end
    puts "Вагон #{carriage_number} прицеплен к поезду #{train_number}"
  end

  def carriage_out_train(train_number, carriage_number)
    list_trains.each do |train|
      unless train.take_train_by_number(train_number).nil?
        list_carriage.each do |carriage|
          unless carriage.take_carriage_by_number(carriage_number).nil?
            train.del_carriage(carriage)
          end
        end
      end
    end
    puts "Вагон под номером #{carriage_number} отцеплен от поезда #{train_number}"
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
    puts "Поезд под номером #{train_number} помещен на станцию #{station_name}"
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

  def show_carriage_by_train(train_number)
    carriage_info = lambda do |carriage, i|
      if carriage.type == :cargo
        puts "#{i + 1}. #{carriage.carriage_number}. #{carriage.type}. #{carriage.show_free_capacity}"
      else
        puts "#{i + 1}. #{carriage.carriage_number}. #{carriage.type}. #{carriage.show_free_place}"
      end
    end
    list_trains.each do |train|
      unless train.take_train_by_number(train_number).nil?
        train.take_block(carriage_info)
      end
    end
  end

  def fill_carriage(carriage_number)
    list_carriage.each do |carriage|
      unless carriage.take_carriage_by_number(carriage_number).nil?
        if carriage.type == :cargo
          puts 'Вагон грузовой'
          puts 'Укажите объем'
          capacity = gets.chomp
          carriage.fill_capacity(capacity)
        else
          carriage.add_place
        end
      end
    end
  end
end
