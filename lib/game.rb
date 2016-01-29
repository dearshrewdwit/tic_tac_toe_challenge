class Game

  attr_reader :grid

  def initialize
    @grid = [ [nil,nil,nil],
              [nil,nil,nil],
              [nil,nil,nil] ]
  end

  def insert(player_symbol, row, column)
    raise "choose a number between 0-2" if invalid_number?(row,column)
    raise "place already taken, try another!" if already_taken?(player_symbol,row,column)
    grid[row][column] = player_symbol
  end

  def finished?
    !grid.any? { |row| row.include?(nil) }
  end

  def winner?
    check_all_rows || check_all_columns || check_all_diagonals
  end

  private

  def check_all_rows
    check_row(0) || check_row(1) || check_row(2)
  end

  def check_row(row_number)
    grid[row_number].uniq.length == 1
  end

  def check_all_columns
    check_column(0) || check_column(1) || check_column(2)
  end

  def check_column(col_number)
    array = []
    array << grid[0][col_number]
    array << grid[1][col_number]
    array << grid[2][col_number]
    array.uniq.length == 1
  end

  def check_all_diagonals
    array = []
    array << grid[0][0]
    array << grid[1][1]
    array << grid[2][2]
    array2 = []
    array2 << grid[2][0]
    array2 << grid[1][1]
    array2 << grid[0][2]
    array.uniq.length == 1 || array2.uniq.length == 1
  end

  def invalid_number?(row, column)
    row < 0 || column < 0 || row > 2 || column > 2
  end

  def already_taken?(player_symbol, row, column)
    grid[row][column] == player_symbol
  end

end
