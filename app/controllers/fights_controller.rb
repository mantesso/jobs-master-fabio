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
                         "#{@fight.winner.name} won! They gained #{FightService::XP_GAIN} XP."
                       else
                         'The fight was a tie!'
                       end

      redirect_to fight_path(@fight)
    else
      @characters = Character.all
      @weapons = Weapon.all
      render :new
    end
  end

  def show
    @fight = Fight.find(params[:id])
    @character1 = @fight.character1
    @character2 = @fight.character2
    @weapon1 = @fight.weapon1
    @weapon2 = @fight.weapon2
    @winner = @fight.winner
  end

  def index
    @fights = Fight.all
  end

  private

  def fight_params
    params.require(:fight).permit(:character1_id, :character2_id, :weapon1_id, :weapon2_id)
  end
end
