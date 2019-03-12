module Players

  class Human < Player
    attr_accessor :name

    # Assign a name to players based on their token
    # def player_name(name, token)
    #    player.name = name if player.token == token
    #    player.name
    # end
  end

  class Computer < Player
  end

end # module Players end
