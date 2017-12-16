require 'set'

class Field
  # what is the field
  # populating a field can have any number of cards from 0 to 15

  attr_reader :cards

  def initialize
    @cards = Set.new
  end

  def add_card(card)
    @cards.add(card)
  end

  def add_cards(cards)
    @cards.merge(cards)
  end

  def remove_card(card)
    @cards.delete(card)
  end

  def remove_cards(cards)
    @cards.subtract(cards)
  end

  def card_count
    @cards.length
  end

  def open_spaces
    15 - card_count
  end

  def find_card(card)
    @cards.find { |c| c == card }
  end

  def find_cards(cards)
    found_cards = cards.each.collect do |card|
      find_card(card)
    end

    found_cards
  end

  def take_card(card)
    found_card = find_card(card)
    remove_card(card)

    found_card
  end

  def take_cards(cards)
    found_cards = cards.each.collect do |card|
      take_card(card)
    end

    found_cards
  end
end
