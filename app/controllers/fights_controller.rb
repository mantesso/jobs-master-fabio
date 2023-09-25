class FightsController < ApplicationController
  def new
    @fight = Fight.new
    @characters = Character.all
    @weapons = Weapon.all
  end

  def create
    @fight = Fight.new(fight_params)

    if @fight.save
      FightService.new(@fight).perform

      flash[:notice] = if @fight.winner
                         "Fight winner is #{@fight.winner.name}"
                       else
                         'The fight was a tie!'
                       end

      redirect_to root_path
    else
      @characters = Character.all
      @weapons = Weapon.all
      render :new
    end
  end

  private

  def fight_params
    params.require(:fight).permit(:character1_id, :character2_id, :weapon1_id, :weapon2_id)
  end
end
