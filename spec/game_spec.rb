require 'spec_helper'

RSpec.describe 'Game' do
  let(:player) { Player.new('Testy McTesterson') }
  let(:game_one) { Game.new }
  let(:game_two) { Game.new }
  subject { game_one }

  it 'has a uuid' do
    expect(subject.uuid).to_not eq game_two.uuid
  end

  it 'has a field' do
    expect(subject.field).to be_kind_of Field
  end

  it 'has a deck' do
    expect(subject.deck).to be_kind_of Deck
  end

  xit 'logs game to ledger'

  describe '#start' do
    context 'with player' do
      let!(:first_card) { game_one.deck.cards.first }

      before do
        subject.add_player(player)
        subject.start
      end

      it 'has a shuffled deck' do
        expect(subject.deck.cards.first).to_not eq first_card
      end

      it 'sets up the field' do
        expect(subject.field.card_count).to be 12
      end

      xit 'logs start of game to ledger'
    end

    context 'without player' do
      it 'will not start without a player' do
        expect { subject.start }.to raise_error 'Player(s) required'
      end

      xit 'logs failure to start game to ledger'
    end
  end

  describe '#add_player' do
    it 'can receive a player' do
      expect(subject.players.length).to be 0
      subject.add_player(Player.new('larry'))
      expect(subject.players.length).to be 1
    end
  end
end
