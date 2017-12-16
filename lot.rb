require 'set'

class Lot
  class LotError < StandardError
    attr_accessor :cards
  end

  attr_reader :lot

  def initialize(cards)
    @lot = Set.new

    @lot.merge(cards)

    begin
      compare_feature('shape')
      compare_feature('color')
      compare_feature('fill')
      compare_feature('count')
    rescue LotError => e
      raise e
    end

    @lot
  end

  def compare_feature(feature)
    feature_lot = @lot.each.collect { |c| c.public_send(feature) }

    return nil unless feature_lot.uniq.count == 2

    raise LotError.new "#{feature} is not a valid lot"
  end
end
