require 'spec_helper'

RSpec.describe 'Ledger' do
  let(:session) { instance_double 'Session', uuid: 'abc123' }
  let(:ledger) { Ledger.new(session, 'spec/logs') }

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
    let(:issuer) { 'Testy McTesterson' }
    let(:payload) { { command: 'lot' } }
    let(:hashed_message) do
      Digest::SHA256.digest TestHelpers.last_log_entry(ledger)
    end

    subject { ledger.record_event(issuer, payload) }

    before { subject }

    it 'records event to session store' do
      expect(TestHelpers.last_log_entry(ledger)).to eq subject.to_s
      expect(hashed_message).to eq subject.digest
    end
  end
end
