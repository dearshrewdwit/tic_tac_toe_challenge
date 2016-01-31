require 'game_manager'

describe GameManager do

  let(:game) { double( insert: true) }
  let(:player_one) { double() }
  let(:computer_player) { double() }

  let(:game_klass) { double( new: game) }
  let(:player_klass) { double( new: player_one) }
  let(:computer_player_klass) { double( new: computer_player) }

  subject(:tic_tac_toe) { described_class.new(game_klass) }

  it "can set player 1 to be a human player" do
    tic_tac_toe.set_player_one(:x, player_klass)
    expect(tic_tac_toe.player1).to eq player_one
  end

  it "can set player 1 to be a computer player" do
    tic_tac_toe.set_player_one(:x, computer_player_klass)
    expect(tic_tac_toe.player1).to eq computer_player
  end

  


end
