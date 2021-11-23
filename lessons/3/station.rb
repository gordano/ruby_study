class Station
  attr_reader :title

  def initialize(title)
    @title = title
    @trains = []
  end

  def add_train(train)
    @trains << train unless @trains.include?(train)
  end

  def send_train(train)
    @trains.delete train if @trains.include?(train)
  end

  def list_all_trains
    @trains.map{|train| puts train.train_number}
  end

  def list_count_trains_by_type
    puts "#{self.title} station. Cargo trains count: #{@trains.select {|train| train.train_type.eql?('cargo')}.size}\n"
    puts "#{self.title} station. Coach trains count: #{@trains.select {|train| train.train_type.eql?('coach')}.size}\n"
  end
end