require 'securerandom'
require 'set'

require_relative './field'
require_relative './deck'

class Game
  # Game is the glue that will hold all the diseparate instances togets
  # it keeps track of the players, field, deck
  # which in turn keep track of their specific responsibilities
  #
  # Game also facilitates in passing cards, sets, to players and the field.

  attr_reader :uuid, :field, :deck, :players, :status

  def initialize(params = {})
    @field = Field.new
    @deck  = Deck.new
    @uuid  = SecureRandom.uuid
    @players = Set.new
  end

  def start
    raise("Player(s) required") if @players.size == 0

    @deck.shuffle

    cards = deck.draw(12)
    @field.add_cards(cards)
  end

  def add_player(player)
    @players.add(player)
  end
end
