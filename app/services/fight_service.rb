class FightService
  def initialize(fight)
    @fight = fight
    @character1 = fight.character1
    @character2 = fight.character2
  end

  def perform
    character1_attack = @character1.attack_points + @fight.weapon1.attack_points
    character2_attack = @character2.attack_points + @fight.weapon2.attack_points

    if character1_attack > character2_attack
      @fight.winner = @character1
    elsif character2_attack > character1_attack
      @fight.winner = @character2
    end

    @fight.save!
  end
end
