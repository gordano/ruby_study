require_relative 'modules/manufacturer.rb'
require_relative 'modules/instance_counter.rb'
require_relative 'railroads/helpers'
require_relative 'railroads/dialogs'
require_relative 'railroads/actions'
require_relative 'railroads/operations'
require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'trains/base.rb'
require_relative 'trains/cargo.rb'
require_relative 'trains/passenger.rb'
require_relative 'wagons/base.rb'
require_relative 'wagons/cargo.rb'
require_relative 'wagons/passenger.rb'
require_relative 'railroad.rb'
require_relative 'tests.rb'


# START TESTS
#Tests.new.run

creator = Railroad.new
creator.seed
creator.main_menu