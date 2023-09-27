class FightService
  XP_GAIN = 15

  def initialize(fight)
    @fight = fight
    @character1 = fight.character1
    @character2 = fight.character2
  end

  def perform
    compute_battle
    determine_winner
    award_winner
  end

  private

  def compute_battle
    character1_attack = @character1.attack_points + @fight.weapon1&.attack_points.to_i
    character2_attack = @character2.attack_points + @fight.weapon2&.attack_points.to_i

    @character1_life = @character1.life_points
    @character2_life = @character2.life_points

    while @character1_life.positive? && @character2_life.positive?
      @character2_life -= character1_attack
      break if @character2_life <= 0

      @character1_life -= character2_attack
    end
  end

  def determine_winner
    if @character1_life > @character2_life
      @fight.winner = @character1
    elsif @character2_life > @character1_life
      @fight.winner = @character2
    end
    @fight.save!
  end

  def award_winner
    @fight.winner.xp += XP_GAIN
    @fight.winner.save!
  end
end
