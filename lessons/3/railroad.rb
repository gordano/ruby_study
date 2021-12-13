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

    trains << TrainsCargo.new('TrainCargo')
    trains << TrainsPassenger.new('PassangerCargo')

    trains.first&.set_route(routes.first)

    wagons << WagonsCargo.new
    wagons << WagonsPassenger.new
  end

  def main_menu
    action_main
  end

  def info
    20.times { puts "\n" }
    puts "\n---------RIAL OBJECTS-------------"
    puts "Станции: #{stations.map(&:title)}"
    puts "Маршруты: #{routes.map(&:title)}"
    puts "Поезда: #{trains.map(&:title)}"
    puts "Вагоны: #{wagons.map(&:title)}"
    puts "------------------------------------\n"
    main_menu
  end
end
