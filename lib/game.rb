class Game
  DEFAULT = 3
  attr_reader :grid
  def initialize(size=DEFAULT)
    @grid = [ [nil,nil,nil],
              [nil,nil,nil],
              [nil,nil,nil] ]
  end
end
