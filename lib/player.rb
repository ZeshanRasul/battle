
class Player
  attr_reader :name, :hit_points
  DEFAULT_HP = 100

  def initialize(name)
    @name = name
    @hit_points = DEFAULT_HP
  end

  def receive_damage
    @hit_points -= 10
  end

  def dead?
    hit_points == 0
  end

end
