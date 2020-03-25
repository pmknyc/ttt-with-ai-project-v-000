#require_relative './players.rb'
require_relative '../game.rb'

module Players
  class Human < Player

    def move(board = [])
      puts "Enter a number from 1 to 9"
      input = gets.strip
      input
    end
  end #class Human end
end #module end
