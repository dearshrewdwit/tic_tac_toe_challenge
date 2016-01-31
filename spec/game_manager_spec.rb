require 'game_manager'

describe GameManager do

  let(:game) { double( insert: true, display_grid: :grid, winner?: false, finished?: false) }
  let(:human_player) { double( symbol: :x, is_a?: true, played?: false, make_move: true) }
  let(:computer_player) { double( symbol: :x, is_a?: false, played?: false, make_move: true) }
  let(:game_klass) { double( new: game) }
  let(:player_klass) { double( new: human_player) }
  let(:computer_player_klass) { double( new: computer_player) }

  subject(:tic_tac_toe) { described_class.new(game_klass, player_klass, computer_player_klass) }

  it  "can set game type, error less than 0" do
    expect { tic_tac_toe.set_game_type(-1) }.to raise_error "invalid game type (1,2,3)"
  end
  it  "can set game type, error greater than 3" do
    expect { tic_tac_toe.set_game_type(4) }.to raise_error "invalid game type (1,2,3)"
  end
  it  "can set game type, error not integer" do
    expect { tic_tac_toe.set_game_type("hello") }.to raise_error "invalid game type (1,2,3)"
  end
  it  "can set game type, valid input" do
    tic_tac_toe.set_game_type(2)
    expect(tic_tac_toe.type).to eq 2
  end

  it "can set player 1 to human, and therefore player 2 to human" do
    tic_tac_toe.set_game_type(1)
    tic_tac_toe.set_player_one(:x, player_klass)
    expect(tic_tac_toe.player1).to eq human_player
    expect(tic_tac_toe.player2).to eq human_player
  end

  it "can set player 1 to computer, and therefore player 2 to computer" do
    tic_tac_toe.set_game_type(2)
    tic_tac_toe.set_player_one(:x, computer_player_klass)
    expect(tic_tac_toe.player1).to eq computer_player
    expect(tic_tac_toe.player2).to eq computer_player
  end

  it "can set player 1 to be human, and therefore player 2 be computer" do
    tic_tac_toe.set_game_type(3)
    tic_tac_toe.set_player_one(:x, player_klass)
    expect(tic_tac_toe.player2).to eq computer_player
  end

  it "can set player 1 to be computer, and therefore player 2 be human" do
    tic_tac_toe.set_game_type(3)
    tic_tac_toe.set_player_one(:x, computer_player_klass)
    expect(tic_tac_toe.player2).to eq human_player
  end

  it "current_player 1 turn" do
    tic_tac_toe.set_game_type(1)
    tic_tac_toe.set_player_one(:x, player_klass)
    tic_tac_toe.play(0,0)
    expect(tic_tac_toe.current_player).to be tic_tac_toe.player1
  end

  it "current_player next turn" do
    tic_tac_toe.set_game_type(1)
    tic_tac_toe.set_player_one(:x, player_klass)
    tic_tac_toe.play(0,0)
    tic_tac_toe.play(0,1)
    expect(tic_tac_toe.current_player).to be tic_tac_toe.player2
  end





end
