class TrainsBase
  attr_reader :train_number, :speed, :route, :wagons, :current_station

  def initialize(train_number)
    @train_number = train_number
    @speed = 0
    @wagons = []
  end

  def type
    self.class::TYPE
  end

  def set_route(route)
    self.route ||= route
    update_current_station
    parking_on_station
  end

  def add_wagons(*args)
    args.each do |wagon|
      next unless wagon.type.eql?(type)
      next unless wagon.train.nil?

      wagon.plug_to(self)
    end
  end

  def remove_wagons(*args)
    args.each do |wagon|
      wagon.unplug_of(self)
    end
  end

  def move_next_station
    return unless route

    if next_station
      away_from_station
      update_current_station(next_station)
      parking_on_station
    end
  end

  def move_previous_station
    return unless route

    if previous_station
      away_from_station
      update_current_station(previous_station)
      parking_on_station
    end
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

  protected

  attr_writer :speed, :route, :wagons

  FULL_SEED = 100
  PARKING_SPEED = 0

  def current_station_index
    return unless route

    route.stations.index(current_station)
  end

  def parking_on_station
    return unless route

    stop
    current_station.add_train(self)
  end

  def away_from_station
    return unless route

    full_gas
    current_station.send_train(self)
  end

  def full_gas
    speed = FULL_SEED
  end

  def stop
    speed = PARKING_SPEED
  end

  def update_current_station(destination_station=nil)
    @current_station = destination_station || route.stations.first
  end

  def add_wagon(wagon)
    wagons << wagon
  end

  def remove_wagon(wagon)
    wagons.delete wagon
  end
end
