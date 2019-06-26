require 'pry'

class Board
  attr_accessor :cells
  @cells = []
# instance var @cells stores state of board in an array.

# initialize --  use #reset! on board.cells property
# for new game of Tic-tac-toe.
  def initialize
    reset!
  end

# reset! method can reset the state of the cells to a pre-game empty board
  def reset!
    @cells = Array.new(9," ")
  end

# input_index: convert user input to array index
  def input_index(input)
      input_integer(input) - 1
  end

  # input_integer: helper method
  def input_integer(input)
    input.to_i #user string input to integer
              # so that #input_index can convert it to array index
  end

# #position takes user input string from "1" to "9"
#   convert to integer & board.cells array index,
#   look up the board cell value at that array index

# taken?
# if player's chosen move position is occupied: true, false if not
  def taken?(input)
    position(input) != " "
  end

# position - helper method for #taken?
  # RETURN  player.token value "X" or "O"
  def position(input)
    @cells[input_index(input)]
  end

# valid_move? 
    #check that moves are between 1-9 and not taken; Boolean return
  def valid_move?(input)
    input_integer(input).between?(1,9) && !taken?(input)
  end

# #update represents updating board when player makes a move.
# #update has two arguments,
# first is position the user wants to occupy in the form of 1-9 strings
# that you will need to convert to the board cells' array index,
# along with the player object making the move.
# When you update the cell's index, set it equal to token of player object
# by calling the`#token method on the player.

  def update(input, player)  # Player class object
    @cells[input.to_i - 1] = player.token
  end

# #turn_count returns how many positions in cells array are filled
#  filled cell count shows num of turns already played
  def turn_count
    count = 0
    self.cells.each do |cell|
      count += 1 if cell != " "
    end
    count
  end

# #full? returns truthy when board cells entirely
# occupied with "X" and "O" token strings
  def full?
    self.cells.all?{|cell| cell == "X" || cell == "O"}
  end

# #display:  board can print current state
  def display
    c = self.cells
    puts " #{c[0]} | #{c[1]} | #{c[2]} "
    puts "-----------"
    puts " #{c[3]} | #{c[4]} | #{c[5]} "
    puts "-----------"
    puts " #{c[6]} | #{c[7]} | #{c[8]} "
  end

end # Board class end
