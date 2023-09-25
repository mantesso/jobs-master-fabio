class FightsController < ApplicationController
  def create
    @fight = Fight.new(fight_params)
    if @fight.save
      FightService.new(@fight).perform
      redirect_to @fight, notice: "The winner is #{@fight.winner.name}"
    else
      # handle failure
    end
  end

  private

  def fight_params
    params.require(:fight).permit(:character1_id, :character2_id, :weapon1_id, :weapon2_id)
  end
end
