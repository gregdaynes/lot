require 'spec_helper'

RSpec.describe 'Lot' do
  let!(:valid_lot_cards) do
     [
       Card.new([Triangle, Red,   Solid, 1]),
       Card.new([Triangle, Green, Solid, 2]),
       Card.new([Triangle, Blue,  Solid, 3]),
     ]
  end

  let!(:invalid_lot_cards) do
     [
       Card.new([Triangle, Red,  Solid,    1]),
       Card.new([Triangle, Red,  Solid,    2]),
       Card.new([Circle,   Blue, Halftone, 2]),
     ]
  end

  it 'creates a valid lot' do
    lot = Lot.new(valid_lot_cards)

    expect(lot).to be_a Lot
    expect(lot.lot).to be_a Set
  end

  it 'fails to create an invalid lot' do
    expect { Lot.new(invalid_lot_cards) }.to raise_error(/not a valid lot/)
  end
end
