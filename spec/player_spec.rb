require 'spec_helper'

RSpec.describe 'Player' do
  let(:lot) do
    Lot.new([
      Card.new([Triangle, Red,   Solid, 1]),
      Card.new([Triangle, Green, Solid, 2]),
      Card.new([Triangle, Blue,  Solid, 3]),
    ])
  end

  let(:player) { Player.new('test_player') }

  it 'returns current lot count' do
    expect(player.count_lots).to be 0
  end

  it 'recives a lot' do
    player.add_lot(lot)

    expect(player.count_lots).to eq 1
    expect(player.lots.first).to eq lot
  end

  it 'deletes a lot' do
    added_lot = player.add_lot(lot)
    removed_lot = player.remove_lot(lot)

    expect(player.count_lots).to eq 0
  end
end
