require 'spec_helper'

RSpec.describe 'Solver' do
  let(:solver) { Solver.new }

  describe '.all_same?' do
    context '3 features are same' do
      subject { solver.send(:all_same?, Red, Red, Red) }

      it { is_expected.to be true }
    end

    context '3 features are different' do
      subject { solver.send(:all_same?, Red, Blue, Green) }

      it { is_expected.to be false }
    end

    context '2 features are same' do
      subject { solver.send(:all_same?, Red, Red, Green) }

      it { is_expected.to be false }
    end
  end

  describe '.all_different?' do
    subject { solver.send(:all_different?, Red, Blue, Green) }

    context '3 features are different' do
      it { is_expected.to be true }
    end

    context '3 features are same' do
      subject { solver.send(:all_different?, Red, Red, Red) }

      it { is_expected.to be false }
    end

    context '2 features are different' do
      subject { solver.send(:all_different?, Red, Red, Blue) }

      it { is_expected.to be false }
    end
  end

  describe '.valid_match?' do
    context 'valid match' do
      subject { solver.send(:valid_match?, Red, Blue, Green) }

      it { is_expected.to be true }
    end

    context 'invalid match' do
      subject { solver.send(:valid_match?, Red, Blue, Red) }

      it { is_expected.to be false }
    end
  end

  describe '.valid_set?' do
    let(:card_a) { Card.new([Triangle, Red, Solid, 1]) }
    let(:card_b) { Card.new([Triangle, Red, Halftone, 2]) }
    let(:card_c) { Card.new([Triangle, Red, Empty, 3]) }
    let(:card_d) { Card.new([Triangle, Red, Solid, 1]) }

    context 'valid set' do
      subject { solver.send(:valid_set?, card_a, card_b, card_c) }

      it { is_expected.to be true }
    end

    context 'invalid set' do
      subject { solver.send(:valid_set?, card_a, card_b, card_d) }

      it { is_expected.to be false }
    end
  end

  describe '.possible_sets' do
    let(:valid_set) do
      Set.new([Card.new([Circle, Blue, Solid, 3]),
               Card.new([Circle, Green, Halftone, 1]),
               Card.new([Circle, Red, Empty, 3])])
    end

    let(:field) do
      Field.new.add_cards [Card.new([Triangle, Blue, Solid, 3]),
                           Card.new([Square, Green, Solid, 2]),
                           Card.new([Square, Blue, Empty, 3]),
                           Card.new([Circle, Green, Halftone, 3]),
                           Card.new([Square, Blue, Empty, 2]),
                           Card.new([Circle, Red, Empty, 1])]
    end

    let(:test_field) { field.merge(valid_set) }

    context 'has set(s)' do
      subject { solver.possible_sets(test_field).flatten }

      it 'returns possible sets' do
        expect(subject).to include valid_set
      end
    end

    context 'does not have a set' do
      subject { solver.possible_sets(field) }

      it '' do
        expect(subject.length).to eq 0
      end
    end
  end
end
