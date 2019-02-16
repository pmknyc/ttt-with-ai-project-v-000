require_relative './players.rb'

class Players::Human

  def move
    puts "Enter a number from 1 to 9"
    input = gets.strip.to_i
    input
  end

end
