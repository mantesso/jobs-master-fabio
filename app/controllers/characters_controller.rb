class CharactersController < ApplicationController
  before_action :set_character, only: %i[show edit update destroy]

  # GET /characters or /characters.json
  def index
    @characters = Character.alive
  end

  # GET /characters/1 or /characters/1.json
  def show; end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit; end

  # POST /characters or /characters.json
  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to characters_path, notice: 'Character was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /characters/1 or /characters/1.json
  def update
    if @character.update(character_params)
      redirect_to characters_path, notice: 'Character was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /characters/1 or /characters/1.json
  def destroy
    @character = Character.find(params[:id])
    @character.soft_delete
    redirect_to characters_path, notice: 'Character was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character
    @character = Character.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def character_params
    params.require(:character).permit(:name, :life_points, :attack_points)
  end
end
