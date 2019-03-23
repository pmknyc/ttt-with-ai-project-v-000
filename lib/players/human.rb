require_relative './players.rb'
# require_relative '../game.rb'
#before I added to require game.rb it didn't run.
# test this again

class Players::Human

  def move(board = [])
    puts "Enter a number from 1 to 9"
    input = gets.strip
    input
  end

end
