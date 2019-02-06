require 'pry'

class Game
  attr_accessor :player_1, :player_2, :board
  attr_reader :token

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

# ??? do I need these reader methods
  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  # Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # middle column
  [2,5,8],  # right column
  [0,4,8],  # left diagnonal
  [2,4,6]   # right diagonal
]

    ## inserts player's move, a board array index number,
    ## to X or O token string character
    #def player_move(board, index, token)
    #   board[index] = token
    #end

def current_player
  if    board.turn_count % 2 == 0
        current_player = self.player_1
  else
        current_player = self.player_2
  end
  current_player
end

    #def turn(board)
    #  puts "Please enter 1-9:"
    #  input = gets.strip
    #  index = input_to_index(input)
    #    if valid_move?(board,index)
    #        player_move(board,index,current_player(board))
    #        display_board(board)
    #    else
    #        turn(board)
    #    end
    #end

def won?
  if
    WIN_COMBINATIONS.detect do |combo|
    (board.cells[combo[0]] == board.cells[combo[1]] &&
    board.cells[combo[1]] == board.cells[combo[2]] &&
    board.taken?(board.cells[combo[0]])) != nil
    combo.to_s
    end
  elsif board.full?
    false
  end
end

def draw?
  board.full? && !self.won?
end

def over?
  self.won? || self.draw? ? true : false
end

def winner
  if self.won? != false
    winner = self.won?.to_a[0]
    # puts "Congratulations! The winner is player #{winner}"
    # winner
  else
    # puts "Please continue playing"
     nil
  end
end

  def play(board)
    while !over?(board)
      turn(board)
    end

    if draw?(board)
        puts "Cat's Game!"
      elsif won?(board)
        puts "Congratulations #{winner(board)}!"
      end
    end

end # class Game end
