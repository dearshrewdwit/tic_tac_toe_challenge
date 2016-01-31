class ComputerPlayer

  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
    @played = false
  end

  def make_move
    raise "already moved this round" if played?
    @played = true
  end

  def reset
    @played = false
  end

  def played?
    @played
  end

end
