require 'game'

describe Game do

  subject(:game) { described_class.new }
  let(:player1_symbol) { :x }
  let(:player1_symbol) { :o }

  it "initializes with a 3x3 grid" do
    expect(game.grid.count).to eq 3
  end

  it "can modify certain elements" do
    game.insert(player1_symbol, 0, 0)
    expect(game.grid[0][0]).to eq player1_symbol
  end

  it "can modify certain elements" do
    game.insert(player1_symbol, 1, 1)
    expect(game.grid[1][1]).to eq player1_symbol
  end

  it "can modify certain elements" do
    game.insert(player1_symbol, 2, 2)
    expect(game.grid[2][2]).to eq player1_symbol
  end

  it "raises error if invalid number" do
    expect {game.insert(player1_symbol, 2, 3)}.to raise_error "choose a number between 0-2"
    expect {game.insert(player1_symbol, 3, 2)}.to raise_error "choose a number between 0-2"
    expect {game.insert(player1_symbol, -1, 2)}.to raise_error "choose a number between 0-2"
    expect {game.insert(player1_symbol, 2, -1)}.to raise_error "choose a number between 0-2"
  end

  it "finished? on an incomplete game returns false" do
    expect(game.finished?).to be false
  end

  it "can return true when all spots are filled" do
    game.insert(player1_symbol, 0, 0)
    game.insert(player1_symbol, 0, 1)
    game.insert(player1_symbol, 0, 2)
    game.insert(player1_symbol, 1, 0)
    game.insert(player1_symbol, 1, 1)
    game.insert(player1_symbol, 1, 2)
    game.insert(player1_symbol, 2, 0)
    game.insert(player1_symbol, 2, 1)
    game.insert(player1_symbol, 2, 2)
    expect(game.finished?).to be true
  end

end
