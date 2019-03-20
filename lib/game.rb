require 'pry'

class Game
  attr_accessor :player_1, :player_2, :board
  attr_reader :token

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  #def start
  #  # Greeting
  #  puts "Welcome to Tic Tac Toe!"
  #  # display blank board.greet_board; diff from board.display
  #  puts "Enter a number for the type of game you want to play."
  #  puts "  2 -- two human players"
  #  puts "  1 -- one Human vs the Computer"
  #  puts "  0 -- the Computer plays itself!"
  #  type = gets.strip.to_i
  #  case type
  #    when 2

  #    when 1

  #    when 0

  # ADD NAME for players -- ask if want to assign NAME
  #  call Players::Human.player_name
  #  end



# board.:  board can print current state
  def display
    c = self.cells
    puts " #{c[0]} | #{c[1]} | #{c[2]} "
    puts "-----------"
    puts " #{c[3]} | #{c[4]} | #{c[5]} "
    puts "-----------"
    puts " #{c[6]} | #{c[7]} | #{c[8]} "
  end

    ## reader of board made in #initialize - NOT NEEDED
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
  if    board.turn_count == 0 || board.turn_count % 2 == 0
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


    ## inserts player's move, a board array index number,
    ## to X or O token string character
    #def player_move(board, index, token)
    #   board[index] = token
    #end

  def turn
    puts "\nIt's your turn, #{current_player}!"  #returns token of current player
    move_input = current_player.move
      if  !board.valid_move?(move_input) # if #valid_move false
        puts "That is not a valid move. Please try again.\n"
        turn
      else
        board.update(move_input,current_player)
      end
    end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end # class Game end
