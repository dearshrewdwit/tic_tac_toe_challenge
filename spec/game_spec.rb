require 'game'

describe Game do

  subject(:game) { described_class.new }

  it "initializes with a 3x3 grid" do
    expect(game.grid.count).to eq 3
  end

end
