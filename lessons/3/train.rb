class Train
  attr_reader :train_number, :train_type, :speed, :wagons_count, :route

  def initialize(train_number, route, train_type='cargo', wagons_count=100)
    @train_number = train_number
    @train_type = train_type # 'cargo' || 'coach'
    @wagons_count = wagons_count
    @route =  route
    @history_route_station = [0]
    @speed = 0
    parking_on_station
  end

  def current_speed
    speed
  end

  def full_gas
    @speed = 100
  end

  def stop
    @speed = 0
  end

  def add_wagons
    @wagons_count += 1 if speed.eql?(0)
  end

  def remove_wagons
    @wagons_count -= 1 if speed.eql?(0) && wagons_count.positive?
  end

  def move_next_station
    if route.stations[@history_route_station[-1] + 1]
      away_from_station
      @history_route_station.insert(-1 , @history_route_station[-1] +1)
      parking_on_station
    end
  end

  def move_previous_station
    if @route.stations[@history_route_station[-1] - 1]
      away_from_station
      @history_route_station.insert(-1 , @history_route_station[-1] - 1)
      parking_on_station
    end
  end

  def current_station
    puts route.stations[@history_route_station[-1]].title
  end

  def previous_station
    puts route.stations[@history_route_station[-2]].title
  end

  def parking_on_station
    stop
    station = route.stations[@history_route_station[-1]]
    station.add_train(self)
  end

  def away_from_station
    full_gas
    station = route.stations[@history_route_station[-1]]
    station.send_train(self)
  end
end
