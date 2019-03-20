require_relative './players.rb'

class Players::Human

  def move(board = [])
    puts "Enter a number from 1 to 9"
    input = gets.strip
    input
  end

end
