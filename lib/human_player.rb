class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_move
    print "where to move"
    move = gets.split(",").map(&:to_i).to_a
  end

  def display(board)
    print board.grid
  end
end
