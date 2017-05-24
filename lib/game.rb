require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board, :current_player, :player_one, :player_two

  def initialize(player_one, player_two)
    @board = Board.new
    @player_one = player_one
    player_one.mark = :X
    player_two.mark = :O
    @player_two = player_two
    @current_player = player_one
  end

  def play_turn
    move = current_player.get_move
    board.place_mark(move, current_player.mark)
    switch_players!
  end

  def switch_players!
    self.current_player = current_player == player_one ? player_two : player_two
  end
end
