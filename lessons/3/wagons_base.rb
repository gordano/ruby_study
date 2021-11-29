class WagonsBase
  attr_reader :train

  def type
    self.class::TYPE
  end

  def plug_to(train)
    return if train.nil?

    lock_hitch(train)
  end

  def unplug_of(train)
    return if train.nil?

    unlock_hitch(train)
  end

  protected

  attr_writer :train

  def lock_hitch(train)
    train.send(:add_wagon, self)
    self.train ||= train
  end

  def unlock_hitch(train)
    self.train = nil if train.send(:remove_wagon,self)
  end
end
