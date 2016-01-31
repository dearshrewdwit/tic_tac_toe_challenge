require './lib/computer_player'
require './lib/game_manager'
require './lib/game'
require './lib/player'

describe GameManager do
  subject(:game) { described_class.new }

  context "human v human" do
    it "x moves first" do
      game.set_game_type(1)
      game.set_player_one(:x, Player)
      game.play(0,0)
      game.play(1,1)
      game.play(0,2)
      game.play(0,2)
      expect(game.play(0,1)).to eq "x has won!"
    end
    it "o moves first" do
      game.set_game_type(1)
      game.set_player_one(:o, Player)
      game.play(0,0)
      game.play(1,1)
      game.play(0,2)
      game.play(0,2)
      expect(game.play(0,1)).to eq "o has won!"
    end
  end

  context "human v computer" do
    it "human moves first" do
      game.set_game_type(3)
      game.set_player_one(:x, Player)
      game.play(0,0)
      game.play
      game.play
    end

    it "computer moves first" do
      game.set_game_type(3)
      game.set_player_one(:x, Player)
    end

  end

  context "computer v computer" do
    it "x moves first" do
      game.set_game_type(2)
      game.set_player_one(:x, ComputerPlayer)
    end
    it "o moves first" do
      game.set_game_type(2)
      game.set_player_one(:o, ComputerPlayer)
    end
  end

end
