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

  def find_move(symbol)
    move = []
    grid.each do |row|
      if row.count(symbol) == 2 && row.include?(nil) && move.empty?
        move << grid.index(row)
        move << row.index(nil)
      end
    end
    if get_column(0).count(symbol) == 2 && get_column(0).include?(nil) && move.empty?
      move << get_column(0).index(nil)
      move << 0
    elsif get_column(1).count(symbol) == 2 && get_column(1).include?(nil) && move.empty?
      move << get_column(1).index(nil)
      move << 1
    elsif get_column(2).count(symbol) == 2 && get_column(2).include?(nil) && move.empty?
      move << get_column(2).index(nil)
      move << 2
    elsif
      get_negative_diagonal.count(symbol) == 2 && get_negative_diagonal.include?(nil) && move.empty?
      if get_negative_diagonal.index(nil) == 0
        move << get_negative_diagonal.index(nil)
        move << 0
      elsif get_negative_diagonal.index(nil) == 1
        move << get_negative_diagonal.index(nil)
        move << 1
      elsif get_negative_diagonal.index(nil) == 2
        move << get_negative_diagonal.index(nil)
        move << 2
      end
    elsif
      get_positive_diagonal.count(symbol) == 2 && get_negative_diagonal.include?(nil) && move.empty?
      if get_positive_diagonal.index(nil) == 0
        move << 2
        move << get_positive_diagonal.index(nil)
      elsif get_positive_diagonal.index(nil) == 1
        move << 1
        move << get_positive_diagonal.index(nil)
      elsif get_positive_diagonal.index(nil) == 2
        move << 0
        move << get_positive_diagonal.index(nil)
      end
    end
    move.empty? ? nil : move
  end

  def get_next_available_move
    move = []
    if grid[1][1].nil? && move.empty?
      2.times { move << 1 }
    elsif grid[0][0].nil? && move.empty?
      2.times { move << 0 }
    elsif grid[0][2].nil? && move.empty?
      move << 0
      move << 2
    elsif grid[2][0].nil? && move.empty?
      move << 2
      move << 0
    elsif grid[2][2].nil? && move.empty?
      2.times { move << 2 }
    elsif move.empty?
      grid.each do |row|
        if row.include?(nil) && move.empty?
          move << grid.index(row)
          move << row.index(nil)
        end
      end
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
    row < 0 || column < 0 || row > 2 || column > 2
  end

  def already_taken?(row, column)
    !grid[row][column].nil?
  end

end
