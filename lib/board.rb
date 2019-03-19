require 'pry'

class Board
  attr_accessor :cells
  @cells = []
# instance var @cells stores state of board in an array.

# initialize always does #reset! to start with empty board
# for new game of TTT
  def initialize
    reset!
  end

# #reset! method can reset the state of the cells to a pre-game empty board
  def reset!
    @cells = Array.new(9," ")
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

# #position takes user input as 1..9
#   convert to integer & array index
#   look up board cell value @cells array index
# return player.token value "X" or "O"
  def position(input)
    @cells[input.to_i - 1]
  end

# #taken?
# true if individual position is occupied, false if not
  def taken?(input)
    position(input) != " "
  end

# #valid_move? Boolean return; check that moves are between 1-9 and not taken.
  def valid_move?(input)
    input.between?(1,9) && !taken?(input)
  end

# #turn_count returns how many positions in cells array are filled
#  filled cell count shows num of turns already played
  def turn_count
    count = 0
      @cells.each do |cell|
        count += 1 if cell != " "
      end
    count
  end

# #full? returns truthy when board cells entirely
# occupied with "X" and "O" token strings
  def full?
    @cells.all? do |cell|
      cell == "X" || cell == "O"
    end
  end

#  #update method represents updating board when player makes a move.
# #update has two arguments,
# first is position the user wants to occupy in the form of 1-9 strings
# that you will need to convert to the board cells' array index,
# along with the player object making the move.
# When you update the cell's index, set it equal to token of player object
# by calling the`#token method on the player.

  def update(input, player)  # Player class object
    @cells[input.to_i - 1] = player.token
    # #self.position(input) why this not work in place of self.cells
  end

end # Board class end
