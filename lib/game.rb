class Game 

  attr_reader :player01, :player02, :turn

  def initialize(player01, player02)
    @player01 = player01
    @player02 = player02
    @turn = @player01
  end

  def attack(victim)
    victim.receive_damage
  end

  def switch_turn
    if @turn == @player01
      @turn = @player02
    elsif @turn == @player02
      @turn = @player01
    end
  end

end