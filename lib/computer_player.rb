class ComputerPlayer
attr_reader :name, :board

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    potential_moves = []
    array = board.grid
    (0..2).each do |row|
      (0..2).each do |column|
        potential_moves << [row, column] if array[row][column].nil?
      end
    end


    potential_moves.each do |move|
      return move if wins?(move)
    end



    potential_moves.sample
  end

  def wins?(move)
    marks = [:X, :O]
    win = false
    marks.each do |mark|
      board.grid[move[0]][move[1]] = mark
      if board.winner == mark
        board.grid[move[0]][move[1]] = nil
        win =  true
      else
        board.grid[move[0]][move[1]] = nil
      end
    end
    win
  end

  def mark=(mark)
  end
end
