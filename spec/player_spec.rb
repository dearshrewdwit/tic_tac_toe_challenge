require 'player'

describe Player do

  let(:symbol) { :x }
  subject(:player) { described_class.new(symbol) }

  it "player has a symbol" do
    expect(player.symbol).to eq symbol
  end

end
