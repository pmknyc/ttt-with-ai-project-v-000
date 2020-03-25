require 'pry'

class Player

  #attr_accessor :name
  attr_reader :token

  def initialize(token)
    @token = token
  end

  # def name=(name)
  #   @name = name
  # end

  # Let users opt to give a name to players
  #  def name_player(name, token)
  #    player.name = name if player.token == token
  #    p player.name
  #    player.name
  #  end

end #Player class end
