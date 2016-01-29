class Player
  attr_reader :name
  def initialize(name)
    @name = name
    @played = false
  end

  def make_move
    raise "already moved this round" if played?
    @played = true
  end

  def reset
    @played = false
  end

  private

  def played?
    @played
  end

end
