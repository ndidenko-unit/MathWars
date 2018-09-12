class Player

  attr_accessor :name, :health

  def initialize (user_input)
    @name = user_input
    @health = 100
  end

  def wound (shot)
    @health = @health - shot
    if @health < 0
      @health = 0
    end
  end
end
