require_relative 'railroads/helpers'
require_relative 'railroads/dialogs'
require_relative 'railroads/actions'
require_relative 'railroads/operations'
require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'trains_base.rb'
require_relative 'trains_cargo.rb'
require_relative 'trains_passenger.rb'
require_relative 'wagons_base.rb'
require_relative 'wagons_cargo.rb'
require_relative 'wagons_passenger.rb'
require_relative 'railroad.rb'
require_relative 'tests.rb'


# START TESTS
#Tests.new.run

creator = Railroad.new
creator.seed
creator.main_menu