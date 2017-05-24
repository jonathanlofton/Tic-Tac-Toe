class Board

  attr_reader :grid

  def initialize(board = Array.new(3) {Array.new(3)})
    @grid = board
  end

  def place_mark(pos,mark)
    @grid[pos[0]][pos[1]] = mark
  end

  def empty?(pos)
    @grid[pos[0]][pos[1]].nil?
  end

  def winner
    #row winner
    @grid.each do |row|
      return :X if row == [:X,:X,:X]
      return :O if row == [:O,:O,:O]
    end

    #column winner
      (0..2).each do |column|
        column_win = []
        column_win << @grid[0][column]
        column_win << @grid[1][column]
        column_win << @grid[2][column]
        return :X if column_win == [:X,:X,:X]
        return :O if column_win == [:O,:O,:O]
      end

      #up diagonal winner
      diag_win = []
      (0..2).each do |num|
        diag_win << @grid[num][num]
        return :X if diag_win == [:X,:X,:X]
        return :O if diag_win == [:O,:O,:O]
      end

      #down diag winner
      return down_diag if :X || :O

      nil
  end

  def down_diag
    down_diag = []
    down_diag << @grid[2][0]
    down_diag << @grid[1][1]
    down_diag << @grid[0][2]

    return :X if down_diag == [:X,:X,:X]
    return :O if down_diag == [:O,:O,:O]
  end

  def over?
    return true if winner == :X || winner == :O
    @grid.each do |row|
      row.any? do |column|
        return false if column.nil?
      end
    end
    true
  end
end
