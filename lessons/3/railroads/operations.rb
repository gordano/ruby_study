module Railroads
  module Operations
    def create_station(station_name='Unnamed')
      stations << Station.new(station_name)
      info
    end

    def create_route(answer)
      route_stations = answer.split(',').map(&:to_i).map(&:pred)
      routes << Route.new(stations[route_stations.first], stations[route_stations.last])
      info
    end

    def create_train(answer)
      train_params = answer.split(',')

      train = case train_params.first
              when '1'
                train = Trains::Passenger.new(train_params.last)
              when '2'
                train = Trans::Cargo.new(train_params.last)
              end
      trains << train if train
      info
    end

    def create_wagon(answer)
      wagon = case answer
              when '1'
                train = Wagons::Passenger.new
              when '2'
                train = Wagons::Cargo.new
              end
      wagons << wagon if wagon
      info
    end

    def add_station_to_route(answer)
      route_and_station = answer.split(',').map(&:to_i)
      routes[route_and_station.first.pred].add_middle_station(stations[route_and_station.last.pred])
      info
    end

    def remove_station_to_route(answer)
      route_and_station = answer.split(',').map(&:to_i)
      routes[route_and_station.first.pred].remove_middle_station(stations[route_and_station.last.pred])
      info
    end

    def add_route_to_train(answer)
      train_and_route = answer.split(',').map(&:to_i)
      trains[train_and_route.first.pred].set_route(routes[train_and_route.last.pred])
      info
    end

    def add_wagon_to_train(answer)
      train_and_wagon = answer.split(',').map(&:to_i)
      trains[train_and_wagon.first.pred].add_wagons(wagons.select{|wagon| wagon.train.nil?}[train_and_wagon.last.pred])
      info
    end

    def remove_wagon_from_train(answer)
      wagon = wagons.select{|wagon| !wagon.train.nil?}[answer.to_i.pred]
      wagon.train.remove_wagons(wagon)
      info
    end

    def move_train(answer)
      train_and_direction = answer.split(',').map(&:to_i)
      train = trains.select{|train| !train.route.nil?}[train_and_direction.first.pred]
      train.move_next_station if train_and_direction.last.eql?(1)
      train.move_previous_station if train_and_direction.last.eql?(0)
      info
    end

    def show_trains_on_station(answer)
      pp stations[answer.to_i.pred].trains.map(&:title)
    end
  end
end