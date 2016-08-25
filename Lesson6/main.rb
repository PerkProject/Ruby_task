require_relative 'program.rb'
require_relative 'validator.rb'
require_relative 'manufacturer.rb'
require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'carriage.rb'
require_relative 'passenger_train.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_carriage.rb'
require_relative 'cargo_carriage.rb'

program = Program.new
puts 'Добро пожаловать в эмулятор железной дороги!'

loop do
  program.program_features
  feature_number = gets.chomp
  program.features_go(feature_number)
end
