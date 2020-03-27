#require_relative '../player.rb'
# require_relative '../game.rb'
#before I added to require game.rb it didn't run.
# test this again

module Players
  class Human < Player

  def move(board = [])
    puts "Enter a number from 1 to 9"
    move_input = gets.strip
    move_input
  end

  end #class Human end
  
end #module end
