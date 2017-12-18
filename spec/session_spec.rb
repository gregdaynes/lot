require 'spec_helper'

RSpec.describe 'Session' do
  let(:player) { Player.new('Testy McTesterson') }
  let(:session_one) { Session.new }
  let(:session_two) { Session.new }
  subject { session_one }

  describe 'new' do
    it 'has a uuid' do
      expect(subject.uuid).to_not eq session_two.uuid
    end

    it 'has a field' do
      expect(subject.field).to be_kind_of Field
    end

    it 'has a deck' do
      expect(subject.deck).to be_kind_of Deck
    end

    it 'has a ledger' do
      expect(subject.ledger).to be_kind_of Ledger
      expect(subject.ledger.session.uuid).to eq subject.uuid
    end
  end

  describe '#start' do
    context 'with player' do
      let!(:first_card) { session_one.deck.cards.first }

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

      it 'logs start of Session to ledger' do
        log_entry = TestHelpers.last_log_entry(subject.ledger)

        expect(log_entry).to match(/#{session_one.uuid}/)
        expect(log_entry).to match(/player/)
        expect(log_entry).to match(/start/)
      end
    end

    context 'without player' do
      it 'will not start without a player' do
        expect { subject.start }.to raise_error 'Player(s) required'

        log_entry = TestHelpers.last_log_entry(subject.ledger)

        expect(log_entry).to match(/player/)
        expect(log_entry).to match(/error/)
      end
    end
  end

  describe '#add_player' do
    it 'can receive a player' do
      expect(subject.players.length).to be 0
      subject.add_player(Player.new('larry'))
      expect(subject.players.length).to be 1
    end

    it 'logs event to ledger' do
      subject.add_player(Player.new('larry'))
      log_entry = TestHelpers.last_log_entry(subject.ledger)

      expect(log_entry).to match(/add_player/)
    end
  end
end
