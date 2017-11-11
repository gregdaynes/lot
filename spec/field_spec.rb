require 'spec_helper'

RSpec.describe 'Field' do
  let!(:deck) do
    test_deck = Deck.new
    3.times { test_deck.shuffle }

    test_deck
  end

  let(:test_cards) do
    Array.new(3).collect { deck.draw }
  end

  let(:test_card) { test_cards[1] }

  subject { Field.new }

  it 'recieves a card' do
    subject.add_card(test_card)
    expect(subject.card_count).to be 1
  end

  it 'recieves a set of cards' do
    subject.add_cards(test_cards)
    expect(subject.card_count).to be 3
  end

  it 'removes a card' do
    subject.add_card(test_card)
    subject.remove_card(test_card)
    expect(subject.card_count).to be 0
  end

  it 'removes a set of cards' do
    subject.add_cards(test_cards)
    subject.remove_cards(test_cards)
    expect(subject.card_count).to be 0
  end

  it 'returns number of cards' do
    subject.add_cards(test_cards)
    expect(subject.card_count).to be 3
  end

  it 'returns open spaces' do
    subject.add_cards(test_cards)
    expect(subject.open_spaces).to be 12
  end

  it 'can find a card' do
    subject.add_cards(test_cards)
    expect(subject.find_card(test_card)).to eq test_card
  end

  it 'can find a set of cards' do
    subject.add_cards(test_cards)
    expect(subject.find_cards(test_cards)).to satisfy do |v|
      v.find { |c| c == test_card }
    end
  end

  it 'takes a card from field' do
    subject.add_cards(test_cards)

    taken_card = subject.take_card(test_card)

    expect(subject.find_card(test_card)).to be nil
    expect(taken_card).to eq test_card
  end

  it 'takes cards from field' do
    subject.add_cards(test_cards)

    taken_cards = subject.take_cards(test_cards)

    expect(subject.find_card(test_card)).to be nil
    expect(taken_cards).to eq test_cards
  end
end
