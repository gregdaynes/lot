require 'spec_helper'

RSpec.describe 'Deck' do
  context 'has 81 cards' do
    subject { Deck.new.cards.count }
    it { is_expected.to eq 81 }
  end

  context 'shuffle' do
    subject { Deck.new }

    it 'can shuffle cards' do
      top_card = subject.cards.first
      subject.shuffle
      shuffled_top_card = subject.cards.first

      expect(shuffled_top_card).to_not be top_card
    end
  end
end
