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

  it "raises error if place already taken" do
    game.insert(player1_symbol, 2, 2)
    expect { game.insert(player1_symbol, 2, 2) }.to raise_error "place already taken, try another!"
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

  it "checks for a win top row" do
    game.insert(player1_symbol, 0, 0)
    game.insert(player1_symbol, 0, 1)
    game.insert(player1_symbol, 0, 2)
    expect(game.winner?).to be true
  end

  it "checks for a win middle row" do
    game.insert(player1_symbol, 1, 0)
    game.insert(player1_symbol, 1, 1)
    game.insert(player1_symbol, 1, 2)
    expect(game.winner?).to be true
  end

  it "checks for a win bottom row" do
    game.insert(player1_symbol, 2, 0)
    game.insert(player1_symbol, 2, 1)
    game.insert(player1_symbol, 2, 2)
    expect(game.winner?).to be true
  end

  it "checks for a win left col" do
    game.insert(player1_symbol, 0, 0)
    game.insert(player1_symbol, 1, 0)
    game.insert(player1_symbol, 2, 0)
    expect(game.winner?).to be true
  end

  it "checks for a win middle col" do
    game.insert(player1_symbol, 0, 1)
    game.insert(player1_symbol, 1, 1)
    game.insert(player1_symbol, 2, 1)
    expect(game.winner?).to be true
  end

  it "checks for a win right col" do
    game.insert(player1_symbol, 0, 2)
    game.insert(player1_symbol, 1, 2)
    game.insert(player1_symbol, 2, 2)
    expect(game.winner?).to be true
  end

  it "checks for a win negative diagonal" do
    game.insert(player1_symbol, 0, 0)
    game.insert(player1_symbol, 1, 1)
    game.insert(player1_symbol, 2, 2)
    expect(game.winner?).to be true
  end

  it "checks for a win positive diagonal" do
    game.insert(player1_symbol, 2, 0)
    game.insert(player1_symbol, 1, 1)
    game.insert(player1_symbol, 0, 2)
    expect(game.winner?).to be true
  end

  it "can find a move in a row" do
    game.insert(:x, 0, 0)
    game.insert(:x, 0, 1)
    expect(game.find_move(:x)).to eq [0, 2]
  end

  it "can find a move in a column" do
    game.insert(:x, 0, 0)
    game.insert(:x, 1, 0)
    expect(game.find_move(:x)).to eq [2, 0]
  end

  it "can find a move in a positive diagonal" do
    game.insert(:x, 0, 0)
    game.insert(:x, 1, 1)
    expect(game.find_move(:x)).to eq [2, 2]
  end

  it "can find a move in a negative diagonal" do
    game.insert(:x, 2, 0)
    game.insert(:x, 1, 1)
    expect(game.find_move(:x)).to eq [0, 2]
  end

  it "if no win, return middle" do
    expect(game.get_next_available_move).to eq [1, 1]
  end

  it "if no win, no middle, return a corner" do
    game.insert(:x, 1, 1)
    expect(game.get_next_available_move).to eq [0, 0]
  end

  it "if no win, no middle, no corner, return next move" do
    game.insert(:o, 2, 0)
    game.insert(:o, 0, 2)
    game.insert(:o, 0, 0)
    game.insert(:o, 2, 2)
    game.insert(:x, 1, 1)
    expect(game.get_next_available_move).to eq [0, 1]
  end



end
