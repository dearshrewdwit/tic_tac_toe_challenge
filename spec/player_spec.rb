require 'player'

describe Player do

  let(:symbol) { :x }
  subject(:player) { described_class.new(symbol) }

  it "player has a symbol" do
    expect(player.symbol).to eq symbol
  end

  it "player can make a move" do
    expect { player.make_move }.not_to raise_error
  end

  it "player can't make a move twice until reset" do
    player.make_move
    expect { player.make_move }.to raise_error "already moved this round"
  end

  it "player reset allows many turns" do
    player.make_move
    player.reset
    expect { player.make_move }.not_to raise_error
  end

end
