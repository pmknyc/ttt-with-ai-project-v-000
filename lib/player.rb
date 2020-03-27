require 'pry'

class Player

  attr_accessor :name
  attr_reader :token

  def initialize(token)
    @token = token
  end

#  # Let users opt to give a name to players
#    def name_player(name, token)
#      @name= name if player.token == token
#      puts "Player #{player.token} is #{player.name}"
#      player.name
#    end

end #Player class end
