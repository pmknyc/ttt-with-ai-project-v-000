require 'pry'

class Player

  attr_accessor :name
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def name=(name)
    @name = name
  end

end #Player class end
