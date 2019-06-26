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

# reset! method resets state of cells to a pre-game empty board
  def reset!
    @cells = Array.new(9," ")
  end

# position:  helper method for #taken?
#   look up the board cell value at that array index
#   takes user's #move input string from "1" to "9"
#   convert to integer & board.cells array index (w/ helper methods)
# RETURN  player.token value "X" or "O"
  def position(input)
    @cells[input_index(input)]
  end

  # input_index: helper to #position
  def input_index(input)
    input_integer(input) - 1 #convert player #move input to array index
  end

  # input_integer: helper to #input_index
  def input_integer(input)
    input.to_i  # user string input to integer
  end           # so that #input_index converts to array index

# taken?
# if player's chosen move position is occupied: true, false if not
  def taken?(input)
    position(input) != " "
  end


# valid_move? 
    #check that moves are between 1-9 and not taken; Boolean return
  def valid_move?(input)
    input_integer(input).between?(1,9) && !taken?(input)
  end

# #update adds player moves to board object
#   called by game.turn to update after every play in game
#   receives 2 args:  player.move_input (1 to 9 as string)
                      current_player
# first is position the user wants to occupy in the form of 1-9 strings
# that you will need to convert to the board cells' array index,
# along with the player object making the move.
# When you update the cell's index, set it equal to token of player object
# by calling the`#token method on the player.

  def update(input, player)  # Player class object
    @cells[input.to_i - 1] = player.token
  end

# turn_count tracks number of turns played in game
#    up to now
# RETURN is count of filled board.cells AKA turn_count
  def turn_count
    count = 0
    self.cells.each do |cell|
      count += 1 if cell != " "
    end
    count
  end

# #full? returns truthy when all board cells
# occupied with "X" or "O" token strings
  def full?
    self.cells.all?{|cell| cell == "X" || cell == "O"}
  end

# #display: board prints current occupied state of 
#   all cells as empty, "X" or "O"
#   this method called at end of every #turn
  def display
    c = self.cells
    puts " #{c[0]} | #{c[1]} | #{c[2]} "
    puts "-----------"
    puts " #{c[3]} | #{c[4]} | #{c[5]} "
    puts "-----------"
    puts " #{c[6]} | #{c[7]} | #{c[8]} "
  end

end # Board class end
