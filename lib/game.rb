class Game 

  attr_reader :player01, :player02

  def initialize(player01, player02)
    @player01 = player01
    @player02 = player02
  end

  def attack(victim)
    victim.receive_damage
  end

end