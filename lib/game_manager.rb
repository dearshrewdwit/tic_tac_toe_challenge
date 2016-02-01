require './lib/game'
require './lib/player'
require './lib/computer_player'

class GameManager

  attr_reader :game, :type, :player1, :player2, :current_player, :other_player, :symbols, :human_player, :computer_player

  def initialize(game=Game, player_klass=Player, computer_player_klass=ComputerPlayer)
    @game = game.new
    @symbols = [:x, :o]
    @human_player = player_klass
    @computer_player = computer_player_klass
  end

  def set_game_type(type)
    raise "invalid game type (1,2,3)" unless type == 1 || type == 2 || type == 3
    @type = type
  end

  def set_player_one(symbol, player_type_klass)
    @player1 = create_new(player_type_klass, symbol)
    @player2 = create_new(player_type_klass, get_other(symbol)) if type == 1 || type == 2
    @player2 = player1.is_a?(human_player) ? create_new(computer_player, get_other(symbol)) : create_new(human_player, get_other(symbol)) if type == 3
    game.display_grid
  end

  def play(row=0, column=0)
    set_current_player
    current_player.is_a?(human_player) ? human_play(row, column) : computer_play
    game.display_grid
    return check_game if check_game
    set_next_player
  end

  private

  def set_current_player
    @current_player ||= player1
    @other_player ||= player2
  end

  def create_new(klass, symbol)
    klass.new(symbol)
  end

  def get_other(symbol)
    (symbols-[symbol])[0]
  end

  def check_game
    if game.winner?
      "#{current_player.symbol} has won!"
    elsif game.finished?
      "game over"
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

  def set_next_player
    @current_player = current_player == player1 ? player2 : player1
    @other_player = other_player == player2 ? player1 : player2
  end

end
