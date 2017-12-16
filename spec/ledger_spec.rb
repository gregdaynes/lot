require 'spec_helper'

RSpec.describe 'Ledger' do
  let(:session) { instance_double "Session", uuid: 'abc123' }
  let(:ledger) { Ledger.new(session, './spec/logs/test.txt') }

  describe '.new' do
    subject { ledger.session }

    it 'creates a new ledger' do
      expect(subject).to eq session
    end

    context 'without a location' do
      let(:ledger) { Ledger.new(session) }

      it 'creates a new ledger' do
        expect(subject).to eq session
      end
    end
  end

  describe '#record_event' do
    let(:player) { instance_double "Player", handle: 'Testy McTesterson' }
    let(:payload) { { command: 'lot' } }
    let(:hashed_message) { Digest::SHA256.digest last_log_entry }

    subject { ledger.record_event(player, payload) }

    before { subject }

    it 'records event to session store' do
      expect(last_log_entry).to eq subject[:message].to_s
      expect(hashed_message).to eq subject[:hash]
    end
  end

  def last_log_entry
    IO.readlines(ledger.session_store)[-1]
  end
end
