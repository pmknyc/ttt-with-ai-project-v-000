require 'pry'

class Board
  attr_accessor :cells
  @cells = []
# instance var @cells stores state of board in an array.

# initialize --  use #reset! on board.cells property
# for new game of Tic-tac-toe.
  def initialize
    self.reset!
  end

# #reset! method can reset the state of the cells to a pre-game empty board
  def reset!
    self.cells = Array.new(9," ")
  end

# #position method takes user's input as 1-9 strings like "2" or "9"
# looks up value of cells at correct index from ***array's perspective***
# All other methods will take input in ***user's perspective*** of 1-9 strings
# and use #position to look up the value according to the cells' array index.

  def position(input) # convert user input 1-9 to array index
    self.cells[input.to_i - 1]
  end

# #taken?
# true if individual position is occupied false if not
  def taken?(input)
    self.position(input) != " "
  end

  def update(input, player)  # Player class object
    self.cells[input.to_i] = player.token
    # #self.position(input) why this not work in place of self.cells
  end
# build #update method represents updating board when player makes a move.
# #update has two arguments,
# first is position the user wants to occupy in the form of 1-9 strings
# that you will need to convert to the board cells' array index,
# along with the player object making the move.
# When you update the cell's index, set it equal to token of player object
# by calling the`#token method on the player.

# Methods below: allow board to  return values based on its state

# #valid_move? Boolean return; check that moves are between 1-9 and not taken.
  def valid_move?(input)
    input.between?(1,9) && !self.taken?(input)
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

# current_player reveals token of player whose turn it is
#   X plays first; when turn count == even num, it's X's turn again
  def current_player
    self.turn_count % 2 == 0 ? "X" : "O"
  end

# #full? returns truthy when board cells entirely
# occupied with "X" and "O" token strings
  def full?
    self.cells.all? do |cell|
      cell == "X" || cell == "O"
    end
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
