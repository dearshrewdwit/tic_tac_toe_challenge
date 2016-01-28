class Game

  attr_reader :grid

  def initialize
    @grid = [ [nil,nil,nil],
              [nil,nil,nil],
              [nil,nil,nil] ]
  end

  def insert(player_symbol, row, column)
    raise "choose a number between 0-2" if invalid_number?(row,column)
    grid[row][column] = player_symbol
  end

  def finished?
    !grid.any? { |row| row.include?(nil) }
  end

  private

  def invalid_number?(row, column)
    row < 0 || column < 0 || row > 2 || column > 2
  end

end
