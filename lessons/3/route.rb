class Route
  include InstanceCounter
  attr_reader :stations

  def initialize(fist_station, last_station)
    @stations = [fist_station, last_station]
  end

  def title
    stations.map(&:title).join('->')
  end

  def add_middle_station(station)
    return if station == stations.first || station == stations.last

    stations.insert(-2, station)
  end

  def remove_middle_station(station)
    return if station == stations.first || station == stations.last

    stations.delete station
  end
end
