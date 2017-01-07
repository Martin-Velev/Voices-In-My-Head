class CharactersController < ApplicationController
  def index
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to root_path
    end

  end


  private
    def character_params
      params.require(:character).permit(:name, :description)
    end

end
