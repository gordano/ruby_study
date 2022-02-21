class Railroad
  prepend Railroads::Helpers, Railroads::Actions, Railroads::Dialogs, Railroads::Operations
  attr_reader :stations, :routes, :trains, :wagons

  def initialize
    @stations = []
    @routes = []
    @trains = []
    @wagons = []
  end

  def seed
    stations << Station.new('Moscow')
    stations << Station.new('Tver')
    stations << Station.new('Piter')

    routes << Route.new(stations[0], stations[2])

    trains << Trains::Cargo.new
    trains << Trains::Passenger.new('PassangerCargo')

    trains.first&.set_route(routes.first)

    wagons << Wagons::Cargo.new
    wagons << Wagons::Passenger.new
  end

  def main_menu
    action_main
  end

  def info
    20.times { puts "\n" }
    puts "\n---------RIAL OBJECTS-------------"
    puts "Stations: #{stations.map(&:title)}"
    puts "Routes: #{routes.map(&:title)}"
    puts "Trains: #{trains.map(&:title)}"
    puts "Wagons: #{wagons.map(&:title)}"
    puts "------------------------------------\n"
  end
end
