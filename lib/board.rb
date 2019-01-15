require 'pry'
class Board
  attr_accessor

  cells = Array.new(9," ")

# has a property, `cells`, that stores the data of the state of the board in an array.
# #reset! method can reset the state of the cells to a pre-game empty board

When a board is initialized, it should start with cells for a new game of Tic-tac-toe. You can and should use `#reset!`.
  def initialized

  end

# #display:  board can print current state
def display( ???board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
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



# #position method takes user's input as 1-9 strings like "2" or "9"
# looks up value of cells at correct index from ***array's perspective***
# All other methods will take input in ***user's perspective*** of 1-9 strings
# and use #position to look up the value according to the cells' array index.

Similarly, you're going to build an `#update` method that represents updating the board when a player makes a move. This method will take two arguments, the first will be the position the user wants to occupy in the form of 1-9 strings that you will need to convert to the board cells' array index, along with the player object making the move. When you update the appropriate index in the cells, you will set it equal to the token of the player object by calling the `#token` method on the player.

Finally, a board can return values based on its state such as `#full?` when entirely occupied with "X" and "O"s and a `#turn_count` based on how many positions in the cells array are filled. `#taken?` will return true or false for an individual position. `#valid_move?` will ensure that moves are between 1-9 and not taken.



]
def input_to_index(input) # convert user input 1-9 to integer 0-8
  input.to_i - 1
end

# inserts player's move, a board array index number,
# to X or O token string character
def player_move(board, index, token)
   board[index] = token
end

# checks if player's move position in board array is already occupied
def position_taken? (board, index)
  index = index.to_i
  board[index] != " " && board[index] != nil
end

# move is valid if: player enters index within 9-cell board array and
# that cell not already occupied
def valid_move?(board, index)
   if index.between?(0,8) && !position_taken?(board,index)
     true
   end
end

def turn_count(board)
  count = 0
  board.each do |move|
    if move == "X" || move == "O"
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

def full?(board)
  board.all? do |cell|
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

=begin
until the game is over
  take turns
end
if the game was won
  congratulate the winner
else if the game was a draw
  tell the players it has been a draw
end
=end


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

end # Board class end
