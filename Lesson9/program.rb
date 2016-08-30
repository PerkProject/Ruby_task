class Program
  attr_reader :list_stations, :list_trains, :list_carriage

  def initialize
    @list_trains = []
    @list_stations = []
    @list_carriage = []
  end

  def program_features_part_one
    puts '1 - Создавать станции'
    puts '2 - Создавать поезда'
    puts '3 - Создавать вагоны'
    puts '4 - Добавлять вагоны к поезду'
    puts '5 - Отцеплять вагоны от поезда'
    puts '6 - Помещать поезда на станцию'
  end

  def program_features_part_two
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
      pre_add_carriage
    when '5'
      pre_out_carriage
    when '6'
      pre_move_train_to_station
    when '7'
      pre_station_list
    when '8'
      pre_show_trains_by_station
    when '9'
      pre_show_carriage_list
    when '10'
      pre_fill_carriage
    when '0'
      puts 'Счастливого пути'
      exit
    else
      puts 'Неизвестная команда'
    end
  end

  private

  def pre_fill_carriage
    puts 'Укажите номер вагона'
    carriage_number = gets.chomp
    fill_carriage(carriage_number)
  end

  def pre_show_carriage_list
    puts 'Введите номер поезда'
    train_number = gets.chomp
    show_carriage_by_train(train_number)
  end

  def pre_show_trains_by_station
    puts 'Введите название станции'
    station_name = gets.chomp
    show_trains_by_stations(station_name)
  end

  def pre_station_list
    puts 'Список станций: '
    show_stations_list
  end

  def pre_add_carriage
    puts 'Для того чтобы добавить вагон к поезду'
    puts 'Введите номер поезда и номер вагона'
    train_number = gets.chomp
    carriage_number = gets.chomp
    carriage_to_train(train_number, carriage_number)
  end

  def pre_out_carriage
    puts 'Для того чтобы отцепить вагон от поезда'
    puts 'Введите номер поезда и номер вагона'
    train_number = gets.chomp
    carriage_number = gets.chomp
    carriage_out_train(train_number, carriage_number)
  end

  def pre_move_train_to_station
    puts 'Для того чтобы поместить поезд на станцию'
    puts 'Введите номер поезда и название станции'
    train_number = gets.chomp
    station_name = gets.chomp
    insert_train_to_station(train_number, station_name)
  end

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
    create_train_by_type
    puts "Создан поезд под номером #{train_number} с типом #{train.type}"
  end

  def create_train_by_type
    train_number = gets.chomp
    type = gets.chomp
    train = CargoTrain.new(train_number) if type == '1'
    train = PassengerTrain.new(train_number) if type == '2'
    list_trains << train
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
      create_passenger_carriage(carriage_number)
    else
      create_cargo_carriage(carriage_number)
    end
  end

  def create_passenger_carriage(carriage_number)
    puts 'Для создания пассажирского вагона укажите количество мест'
    place_qty = gets.chomp
    carriage = PassengerCarriage.new(carriage_number, place_qty)
    finish_create_carriage(carriage)
  end

  def create_cargo_carriage(carriage_number)
    puts 'Для создания грузового вагона укажите его объем'
    capacity_all = gets.chomp
    carriage = CargoCarriage.new(carriage_number, capacity_all)
    finish_create_carriage(carriage)
  end

  def finish_create_carriage(carriage)
    list_carriage << carriage
    puts "Вагон под номером #{carriage_number} создан"
  end

  def carriage_to_train(train_number, carriage_number)
    list_trains.each do |train|
      next if train.take_train_by_number(train_number).nil?
      list_carriage.each do |carriage|
        unless carriage.take_carriage_by_number(carriage_number).nil?
          train.add_carriage(carriage)
        end
      end
    end
    puts "Вагон #{carriage_number}"
    puts "прицеплен к поезду #{train_number}"
  end

  def carriage_out_train(train_number, carriage_number)
    list_trains.each do |train|
      next if train.take_train_by_number(train_number).nil?
      list_carriage.each do |carriage|
        unless carriage.take_carriage_by_number(carriage_number).nil?
          train.del_carriage(carriage)
        end
      end
    end
    puts "Вагон под номером #{carriage_number}"
    puts "отцеплен от поезда #{train_number}"
  end

  def insert_train_to_station(train_number, station_name)
    list_stations.each do |station|
      next if station.take_station_by_station_name(station_name).nil?
      list_trains.each do |train|
        unless train.take_train_by_number(train_number).nil?
          station.take_train(train)
        end
      end
    end
    puts "Поезд под номером #{train_number}"
    puts "помещен на станцию #{station_name}"
  end

  def show_stations_list
    list_stations.each do |station|
      puts station.station_name.to_s
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
      carriage_info_by_type(i, carriage)
    end
    list_trains.each do |train|
      unless train.take_train_by_number(train_number).nil?
        train.take_block(carriage_info)
      end
    end
  end

  def carriage_info_by_type(i, carriage)
    if carriage.type == :cargo
      puts "#{i + 1}. #{carriage.carriage_number}."
      puts "#{carriage.type}. #{carriage.show_free_capacity}"
    else
      puts "#{i + 1}. #{carriage.carriage_number}."
      puts "#{carriage.type}. #{carriage.show_free_place}"
    end
  end

  def fill_carriage(carriage_number)
    list_carriage.each do |carriage|
      if carriage.take_carriage_by_number(carriage_number).nil?
        carriage.add_place
      else
        next unless carriage.type == :cargo
        puts 'Укажите объем'
        capacity = gets.chomp
        carriage.fill_capacity(capacity)
      end
    end
  end
end
