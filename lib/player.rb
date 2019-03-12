require 'pry'

class Player

  attr_reader :token, :name

  def initialize(token)
    @token = token
  end

  def name=(name)
    @name = name
  end

end #Player class end
