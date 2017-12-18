require 'securerandom'
require 'set'

require_relative './field'
require_relative './deck'
require_relative './ledger'

class Session
  # Session is the glue that will hold all the diseparate instances togets
  # it keeps track of the players, field, deck
  # which in turn keep track of their specific responsibilities
  #
  # Session also facilitates in passing cards, sets, to players and the field.

  attr_reader :uuid, :field, :deck, :players, :status, :ledger

  def initialize
    @field = Field.new
    @deck  = Deck.new
    @uuid  = SecureRandom.uuid
    @players = Set.new

    @ledger = Ledger.new(self)
  end

  def start
    if @players.empty?
      @ledger.record_event('player',
                           'error',
                           'Could not start without players')
      raise('Player(s) required')
    end

    @deck.shuffle

    cards = deck.draw(12)
    @field.add_cards(cards)

    @ledger.record_event('player',
                         'start')
  end

  def add_player(player)
    @ledger.record_event('player',
                         'add_player',
                         player)

    @players.add(player)
  end
end
