class Game

  attr_reader :grid

  def initialize
    @grid = [ [nil,nil,nil],
              [nil,nil,nil],
              [nil,nil,nil] ]
  end

  def insert(player_symbol, row, column)
    raise "choose a number between 0-2" if invalid_number?(row,column)
    raise "place already taken, try another!" if already_taken?(row,column)
    grid[row][column] = player_symbol
  end

  def finished?
    !grid.any? { |row| row.include?(nil) }
  end

  def winner?
    check_all_rows || check_all_columns || check_all_diagonals
  end

  def display_grid
    grid.map { |r| r.join(' | ') }.insert(1, '---------').insert(3, '---------').each { |r| puts r }
  end

  def has_possible_win?(array, symbol)
    array.count(symbol) == 2 && array.include?(nil)
  end

  def find_move(symbol)
    move = nil
    grid.each do |row|
      move ||= [grid.index(row),row.index(nil)] if has_possible_win?(row, symbol)
    end
    move ||= [get_column(0).index(nil), 0] if has_possible_win?(get_column(0), symbol)
    move ||= [get_column(1).index(nil), 1] if has_possible_win?(get_column(1), symbol)
    move ||= [get_column(2).index(nil), 2] if has_possible_win?(get_column(2), symbol)

    if has_possible_win?(get_negative_diagonal, symbol)
      move ||= [0, 0] if get_negative_diagonal.index(nil) == 0
      move ||= [1, 1] if get_negative_diagonal.index(nil) == 1
      move ||= [2, 2] if get_negative_diagonal.index(nil) == 2
    end

    if has_possible_win?(get_positive_diagonal, symbol)
      move ||= [2, 0] if get_positive_diagonal.index(nil) == 0
      move ||= [1, 1] if get_positive_diagonal.index(nil) == 1
      move ||= [0, 2] if get_positive_diagonal.index(nil) == 2
    end
    move
  end

  def get_next_available_move
    move = nil
    move ||= [1,1] if grid[1][1].nil?
    move ||= [0,0] if grid[0][0].nil?
    move ||= [0,2] if grid[0][2].nil?
    move ||= [2,0] if grid[2][0].nil?
    move ||= [2,2] if grid[2][2].nil?
    grid.each do |row|
      move ||= [grid.index(row), row.index(nil)] if row.include?(nil)
    end
    move
  end

  private

  def check_all_rows
    check(grid[0]) || check(grid[1]) || check(grid[2])
  end

  def check_all_columns
    check(get_column(0)) || check(get_column(1)) || check(get_column(2))
  end

  def get_column(col_number)
    grid.map { |row| row[col_number] }
  end

  def get_negative_diagonal
    counter = 0
    array = []
    grid.each do |row|
      array << row[counter]
      counter += 1
    end
    array
  end

  def get_positive_diagonal
    counter = grid.length-1
    array = []
    grid.each do |row|
      array << row[counter]
      counter -= 1
    end
    array.reverse
  end

  def check_all_diagonals
    check(get_negative_diagonal) || check(get_positive_diagonal)
  end

  def check(type)
    type.uniq.length == 1 && !type.include?(nil)
  end

  def invalid_number?(row, column)
    row < 0 || column < 0 || row > grid.length-1 || column > grid.length-1
  end

  def already_taken?(row, column)
    !grid[row][column].nil?
  end

end
