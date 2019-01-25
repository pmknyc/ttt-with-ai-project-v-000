require 'pry'

class Board
  attr_accessor :cells
  @cells = []
# instance var @cells stores state of board in an array.

# When a board is initialized, it should start with cells
# for a new game of Tic-tac-toe. You can and should use `#reset!`.
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


# #display:  board can print current state
def display
  c = self.cells
  puts " #{c[0]} | #{c[1]} | #{c[2]} "
  puts "-----------"
  puts " #{c[3]} | #{c[4]} | #{c[5]} "
  puts "-----------"
  puts " #{c[6]} | #{c[7]} | #{c[8]} "
end

## Define your WIN_COMBINATIONS constant
#WIN_COMBINATIONS = [
#  [0,1,2],  # Top row
#  [3,4,5],  # Middle row
#  [6,7,8],  # Bottom row
#  [0,3,6],  # Left column
#  [1,4,7],  # middle column
#  [2,5,8],  # right column
#  [0,4,8],  # left diagnonal
#  [2,4,6]   # right diagonal
#]

def update(input, player) # need Player class object coded
  #self.cells << self.position
end
# build #update method represents updating board when player makes a move.
# #update has two arguments,
# first is position the user wants to occupy in the form of 1-9 strings
# that you will need to convert to the board cells' array index,
# along with the player object making the move.
# When you update the cell's index, set it equal to token of player object
# by calling the`#token method on the player.



# Finally, a board can return values based on its state

# #turn_count based on how many positions in cells array are filled.


# #taken?
# true if individual position is occupied
# false if not occupied
def taken?(input)
  self.cells[self.position(input)] == "X"
end

# #valid_move? will ensure that moves are between 1-9 and not taken.
def valid_move?
    && !taken?(board,index)
     true
   end
end

# #turn_count based on how many positions in cells array are filled.
def turn_count
  count = 0
  self.cells.each do |cell|
    if cell == "X" || cell == "O"
    count += 1
    end
  end
  count
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
  # puts "Player #{current_player}'s turn"
  # return current_player
end

#def current_player(board)
#  if turn_count(board) % 2 == 0
#    current_player = "X"
#    else current_player = "O"
#    end
#   puts "Player #{current_player}'s turn"
#   return current_player
#end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
    if valid_move?(board,index)
        player_move(board,index,current_player(board))
        display_board(board)
    else
        turn(board)
    end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board,combo[0])
  end
end

# #full? returns truthy when board cells entirely
# occupied with "X" and "O" token strings
def full?
  self.cells.all? do |cell|
    cell == "X" || cell == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) ? true : false
end

def winner(board)
  if won?(board)
    token = won?(board)[0]
    winner = board[token]
    # puts "Congratulations! The winner is player #{winner}"
    winner
  elsif won?(board) == nil
    # puts "Please continue playing"
     nil
  end
end

end # Board class end
