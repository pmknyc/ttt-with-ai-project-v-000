require 'pry'

class Game
  attr_accessor :player_1, :player_2, :board
  attr_reader :token

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def start
    #  Greeting
    puts "Welcome to Tic Tac Toe\n!"
    puts "Enter a number for the type of game you want to play."
    puts "  2 -- two human players"
    puts "  1 -- one Human vs the Computer"
    puts "  0 -- the Computer plays itself!"
    type = gets.strip.to_i
    case type
      when 2 # game.new with default arguments
        p "type 2"
        Game.new
                #  call Players::Human.player_name
                # ADD NAME for players -- ask if want to assign NAME
      when 1 # game.new w/ 1 human + 1 computer player arguments
          human_computer
      when 0 # game.new w/ 2 computer player arguments
          computer_computer
    end
  end

    def human_computer
      p "in human_computer method"
      Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
      p player_1
      p player_2
    end

    def computer_computer
      p "in computer_computer method"
      Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
      p player_1
      p player_2
    end

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
    move_input = current_player.move
      if  !board.valid_move?(move_input) # if #valid_move false
        puts "That is not a valid move. Please try again.\n"
        turn
      else
        board.update(move_input,current_player)
        board.display
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
