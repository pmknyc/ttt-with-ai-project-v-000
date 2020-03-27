module Players

  class Human < Player

    attr_accessor :name

#  # Let users opt to give a name to players
#    def name_player(name, token)
#      player.name = name if player.token == token
#      p player.name
#      player.name
#    end

  end # class Human end

  class Computer < Player
  end

end # module Players end
