require './lib/game'
require './lib/player'
require './lib/computer_player'

class GameManager

  attr_reader :game, :type, :player1, :player2, :current_player, :other_player

  def initialize(game=Game)
    @game = game.new
  end

  def set_game_type(type)
    @type = type
  end

  def set_player_one(symbol, player_type_klass)
    @player1 = player_type_klass.new(symbol)
    if type == 1 || type == 2
      @player2 = player_type_klass.new(:o)
    elsif type == 3
      player1.is_a?(Player) ? (@player2 = ComputerPlayer.new(:o)) : (@player2 = Player.new(:o))
    else
      "invalid game type"
    end
    game.display_grid
  end

  def play(row=0, column=0)
    get_current_player
    current_player.is_a?(Player) ? human_play(row, column) : computer_play
    current_player.make_move
    game.display_grid
    check_game
  end

  private

  def check_game
    if game.winner?
      "#{current_player.symbol} has won!"
    elsif game.finished?
      "game over"
    else
    end
  end

  def human_play(row, column)
    game.insert(current_player.symbol, row, column)
  end

  def computer_play
    move ||= game.find_move(current_player.symbol)
    move ||= game.find_move(other_player.symbol)
    move ||= game.get_next_available_move
    game.insert(current_player.symbol, move[0],move[1])
  end

  def get_current_player
    if !player1.played?
      @current_player = player1
      @other_player = player2
    elsif !player2.played?
      @current_player = player2
      @other_player = player1
    else
      reset_players
      get_current_player
    end
  end

  def reset_players
    player1.reset
    player2.reset
  end

end
