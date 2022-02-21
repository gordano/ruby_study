class Tests
    attr_reader :station_moscow, :station_tver, :station_piter,
                :route_moscow_piter, :route_moscow_tver_piter,
                :train_mp_cargo, :train_mtp_passenger,
                :wagon_cargo_1,:wagon_cargo_2,:wagon_cargo_3,:wagon_cargo_4,
                :wagon_passenger_1,:wagon_passenger_2,:wagon_passenger_3

  def run
    generate_seeds

    route_moscow_piter.add_middle_station(station_tver)
    puts "Route equal 3 station: #{route_moscow_piter.stations.map(&:title).count.eql?(3)}"

    route_moscow_piter.remove_middle_station(station_tver)
    puts "Route equal 2 station: #{route_moscow_piter.stations.map(&:title).count.eql?(2)}"

    route_moscow_tver_piter.add_middle_station(station_tver)
    puts "Route Moscow->Piter exclude Tver: #{!route_moscow_piter.stations.map(&:title).include?('Tver')}"
    puts "Route Moscow->Tver->Piter include Tver: #{route_moscow_tver_piter.stations.map(&:title).include?('Tver')}"

    train_mp_cargo.set_route(route_moscow_piter)
    train_mtp_passenger.set_route(route_moscow_tver_piter)

    train_mp_cargo.add_wagons(wagon_cargo_1,wagon_cargo_2,wagon_cargo_3, wagon_passenger_1)
    puts "Cargo train have 3 wagons: #{train_mp_cargo.wagons.count.eql?(3)}"
    puts "Cargo train have only cargo wagons: #{train_mp_cargo.wagons.map(&:type).uniq.eql?([train_mp_cargo.type])}"

    train_mtp_passenger.add_wagons(wagon_passenger_1,wagon_passenger_2,wagon_passenger_3)
    puts "Passenger train have 3 wagons: #{train_mp_cargo.wagons.count.eql?(3)}"
    train_mtp_passenger.remove_wagons(wagon_passenger_1,wagon_passenger_2)
    puts "Passenger train have 1 wagons: #{train_mtp_passenger.wagons.count.eql?(1)}"
    puts "Passenger train have only passenger wagons: #{train_mtp_passenger.wagons.map(&:type).uniq.eql?([train_mtp_passenger.type])}"

    puts "Station Moscow has 2 trains: #{station_moscow.trains.count.eql?(2)}"
    train_mp_cargo.move_next_station
    puts "Piter is current station: #{train_mp_cargo.current_station.title.eql?(station_piter.title)}"
    puts "Piter is next station: #{train_mp_cargo.next_station.title.eql?(station_piter.title)}"
    puts "Moscow is previous station: #{train_mp_cargo.previous_station.title.eql?(station_moscow.title)}"

    puts "Station Moscow has 1 train: #{station_moscow.trains.count.eql?(1)}"
    train_mtp_passenger.move_next_station
    puts "Tver is current station: #{train_mtp_passenger.current_station.title.eql?(station_tver.title)}"
    puts "Piter is next station: #{train_mtp_passenger.next_station.title.eql?(station_piter.title)}"
    puts "Moscow is previous station: #{train_mtp_passenger.previous_station.title.eql?(station_moscow.title)}"

    puts "Station Moscow has 0 trains: #{station_moscow.trains.count.eql?(0)}"
    puts "Station Tver has 1 train: #{station_tver.trains.count.eql?(1)}"
    puts "Station Piter has 1 train: #{station_piter.trains.count.eql?(1)}"

    train_mp_cargo.move_previous_station
    train_mtp_passenger.move_previous_station

    puts "Station Moscow has 2 trains: #{station_moscow.trains.count.eql?(2)}"
    puts "Station Tver has 0 train: #{station_tver.trains.count.eql?(0)}"
    puts "Station Piter has 0 train: #{station_piter.trains.count.eql?(0)}"
  end

  def generate_seeds
    #CREATE STATIONS
    @station_moscow = Station.new('Moscow')
    @station_tver = Station.new('Tver')
    @station_piter = Station.new('Piter')

    #CREATE ROUTES
    @route_moscow_piter = Route.new(station_moscow, station_piter)
    @route_moscow_tver_piter = Route.new(station_moscow, station_piter)

    #CREATE TRAINS
    @train_mp_cargo = Trains::Cargo.new('Train mp cargo')
    @train_mtp_passenger = Trains::Passenger.new('Train mtp passenger')

    #CREAT WAGONS
    @wagon_cargo_1 = Wagons::Cargo.new
    @wagon_cargo_2 = Wagons::Cargo.new
    @wagon_cargo_3 = Wagons::Cargo.new

    @wagon_passenger_1 = Wagons::Passenger.new
    @wagon_passenger_2 = Wagons::Passenger.new
    @wagon_passenger_3 = Wagons::Passenger.new
  end
end
