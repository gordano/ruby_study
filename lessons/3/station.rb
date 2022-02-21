class Station
  include InstanceCounter
  attr_reader :title, :trains
  @@stations = []

  def self.all
    @@stations
  end

  def initialize(title)
    @@stations << self
    register_instance
    @title = title
    @trains = []
  end

  def add_train(train)
    trains << train unless trains.include?(train)
  end

  def send_train(train)
    trains.delete train if trains.include?(train)
  end

  def trains_by(type)
    trains.select {|train| train.train_type.eql?(type)}
  end

  def count_trains_by(type)
    trains_by(type).count
  end
end
