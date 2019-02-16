require 'pry'

class Game
  attr_accessor :player_1, :player_2, :board
  attr_reader :token

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

    ## reader of board made in #initialize
    #  def board
    #    @board
    #  end
    #
    #  def player_1
    #    @player_1
    #  end
    #
    #  def player_2
    #    @player_2
    #  end

  # Winning cells combinations constant
WIN_COMBINATIONS = [
  [0,1,2], # input 1,2,3 Top row
  [3,4,5], # input 4,5,6 Mid row
  [6,7,8], # input 7,8,9 Bot row
  [0,3,6], # input 1,4,7 Lft col
  [1,4,7], # input 2,5,8 mid col
  [2,5,8], # input 3,6,9 rgt col
  [0,4,8], # input 1,5,9 lft diag
  [2,4,6]  # input 3,5,7 rgt diag
]

def current_player
  if    board.turn_count % 2 == 0
        current_player = self.player_1
  else
        current_player = self.player_2
  end
  current_player
end

# #won? returns the correct winning combination in the case of a win
  def won?
    # iteration returns 3 winning cells as win_combo array; or nil
    win_combo = WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]] &&
      board.cells[combo[2]] != " "
    end
    # won? returns winning array if found; or false
    win_combo == nil ? false : win_combo
  end

  # game tied when board full and no win combo achieved
  def draw?
    board.full? && self.won? == false
  end

  # game over if a draw or a win condition met
  def over?
    self.draw? || self.won? != false
  end

  def winner
    if self.won? != false
      return board.cells[self.won?[0]]
    else
      nil
    end
  end

  def play
    while !self.over?
      self.turn
    end

    if self.draw?
      puts "Cat's Game!"
    elsif self.won? != false
      puts "Congratulations #{self.winner}!"
    end
  end

    ## inserts player's move, a board array index number,
    ## to X or O token string character
    #def player_move(board, index, token)
    #   board[index] = token
    #end

    def turn
      puts "It's your turn, #{self.current_player}!\n Please enter 1 - 9:"
      input = gets.strip
    #  index = input_to_index(input)
    #    if valid_move?(board,index)
    #        player_move(board,index,current_player(board))
    #        display_board(board)
    #    else
    #        turn(board)
    #    end
    end
end # class Game end
