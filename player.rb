require 'set'


class Player
  attr_reader :handle, :lots

  def initialize(handle)
    @handle = handle
    @lots = Set.new
  end

  def add_lot(lot)
    @lots.add(lot)
  end

  def remove_lot(lot)
    @lots.delete(lot)
  end

  def count_lots
    @lots.size
  end
end
