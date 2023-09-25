class FightService
  def initialize(fight)
    @fight = fight
    @character1 = fight.character1
    @character2 = fight.character2
  end

  def perform
    character1_life = @character1.life_points
    character2_life = @character2.life_points

    character1_attack = @character1.attack_points + @fight.weapon1.attack_points
    character2_attack = @character2.attack_points + @fight.weapon2.attack_points

    while character1_life > 0 && character2_life > 0
      character2_life -= character1_attack
      break if character2_life <= 0

      character1_life -= character2_attack
      break if character1_life <= 0
    end

    if character1_life > character2_life
      @fight.winner = @character1
    elsif character2_life > character1_life
      @fight.winner = @character2
    end
    # if @fight.winner.nil? the fight was a tie

    @fight.save!
  end
end
