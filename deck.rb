require_relative 'feature'
require_relative 'card'

class Deck
  # deck is an array of cards that have not yet been put into field
  # deck should be shuffleable
  # deck should have a limited number of cards
  # 81 cards in a default deck

  attr_accessor :cards

  def initialize
    # each color, fill, shape, count combination gets a card
    @cards = feature_combinations.map do |feature_set|
      Card.new(feature_set)
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def draw(count = 1)
    @cards.shift(count)
  end

  private

  def feature_combinations
    features = [
      [1, 2, 3],
      [Triangle, Square, Circle],
      [Red, Green, Blue],
      [Solid, Halftone, Empty]
    ]

    features.first.product(*features[1..-1])
  end
end
