require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'trains_base.rb'
require_relative 'trains_cargo.rb'
require_relative 'trains_passenger.rb'
require_relative 'wagons_base.rb'
require_relative 'wagons_cargo.rb'
require_relative 'wagons_passenger.rb'
require_relative 'tests.rb'

Tests.new.run
