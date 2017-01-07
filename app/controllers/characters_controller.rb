class CharactersController < ApplicationController

  before_action :find_character, only: [:show, :edit, :update, :destroy]
  def index
    @characters = Character.all.order("created_at DESC")
  end

  def new
    @character = Character.new
  end

  def show
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @character.update(character_params)
      redirect_to character_path(@character)
    else
      render 'edit'
    end
  end

  def destroy
    @character.destroy
    redirect_to root_path
  end



  private
    def character_params
      params.require(:character).permit(:name, :description)
    end

    def find_character
      @character = Character.find(params[:id])
    end


end
