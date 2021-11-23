class Train
  attr_reader :train_number, :train_type, :speed, :wagons_count, :route

  def initialize(train_number, train_type='cargo', wagons_count=100)
    @train_number = train_number
    @train_type = train_type # 'cargo' || 'coach'
    @wagons_count = wagons_count
    @speed = 0
  end

  def set_route(route)
    @route ||= route
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
    return unless route

    if next_station
      away_from_station
      @current_station = next_station
      parking_on_station
    end
  end

  def move_previous_station
    return unless route

    if previous_station
      away_from_station
      @current_station = previous_station
      parking_on_station
    end
  end

  def current_station_index
    return unless route

    route.stations.index(current_station)
  end

  def current_station
    return unless route

    @current_station ||= route.stations.first
  end

  def previous_station
    return unless route
    return current_station if route.stations.first.eql? current_station

    route.stations[current_station_index.pred]
  end

  def next_station
    return unless route
    return current_station if route.stations.last.eql? current_station

    route.stations[current_station_index.next]
  end

  def parking_on_station
    return unless route

    stop
    station = current_station
    station.add_train(self)
  end

  def away_from_station
    return unless route

    full_gas
    station = current_station
    station.send_train(self)
  end
end
