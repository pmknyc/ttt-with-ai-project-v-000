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
    # Welcome message for first game
    puts "Welcome to Tic Tac Toe!\n"
    board.display
    puts "\nWhat type of game do you want to play?\n"
    puts "  hh  -- two human players"
    puts "  hc  -- one Human vs the Computer"
    puts "  cc  -- the Computer plays itself!"
    puts "  oo  -- to stop the game.\n"
    puts "\nType your answer then press <Enter> \n"
    game_type
  end
  
  def game_type
    type = gets.strip.downcase
    case type
      when "hh" # game.new called by executable: ./bin/tictactoe 
                # sets up default players: 2 humans, player_1 is "X"
        "\n\n"
        instruction_board # show players board w/ numbered cells
                # ??? call Players::Human.player_name
                # ??? ADD NAME for players -- ask if want to assign NAME
      when "hc" 
          "\n\n"
          human_computer #calls game.new w/ 1 human + 1 computer player
      when "cc" 
          "\n\n"
          computer_computer #calls game.new w/ 2 computer players
      when "oo"
          puts "Goodbye, thanks for playing"
          puts "\n\n"
          exit
      else
          puts "I don't understand that. Please try again"
          game_type
    end
  end

  def human_computer
    Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
    #p player_1
    #p player_2
    instruction_board
  end

  def computer_computer
    Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
    #p player_1
    #p player_2
    play
  end

  def current_player
    if    board.turn_count == 0 || board.turn_count % 2 == 0
          current_player = self.player_1
    else
          current_player = self.player_2
    end
    current_player
  end

  def turn
    move_input = current_player.move
      if !board.valid_move?(move_input) 
        puts "\n That is not a valid move. Please try again.\n"
        turn
      else
        board.update(move_input,current_player)
        board.display
      end
  end

  def instruction_board
    puts "During the game use numbers as shown here "
    puts "To make a move, you'll be prompted to enter a number\n\n"
    puts "     1 | 2 | 3 "
    puts "    -----------"
    puts "     4 | 5 | 6 "
    puts "    -----------"
    puts "     7 | 8 | 9 \n\n"
    puts "When ready to play, press <Enter>"
    ready = gets
    if ready == "\n"
      play
    else
      instruction_board
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
    end      # game_result use as separate method if not testing with learn.co
  end 

  # def game_result
  #   if draw?
  #     puts "\nCat's Game! \n\n"
  #   else
  #     puts "\nCongratulations #{winner}! \n"
  #       # play_again method raises error in learn.co tests
  #   end
  # end


    # Winning board combinations constant
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
  # game over if a draw or a win condition is TRUE
  def over?
    draw? || won? != false
  end

  # game tied when board full and no win combo achieved
  def draw?
    board.full? && !won? 
  end
  
  # #won? returns array of winning board cells if found;
  #       or FALSE if game not yet won
  def won?
    # iteration returns 3 winning cells as win_combo array; or nil
    win_combo = WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]] &&
      board.cells[combo[2]] != " "
    end
    win_combo == nil ? false : win_combo
  end

  # #winner returns winning player as "X" or "O" 
  def winner  
    if won? != false #first check if game was won
      return board.cells[self.won?[0]] 
          #get winner token from first cell in win combo array
    else
      nil
    end
  end

    # Add play_again method when not have to pass learn.co tests!
  # def play_again
  #   puts "\nWant to play again? "
  #   puts "If yes, enter 'play'."
  #   puts "If not, enter 'exit'.\n\n"
  #   again = gets.strip.downcase
  #   
  #   if again == 'play'
  #     system './bin/tictactoe'
  #   elsif again == 'exit'
  #     exit
  #   else 
  #     puts "\n\nI didn't understand. Please try again."
  #     play_again
  #   end
  # end

end # class Game end
