class CreaturesController < ApplicationController

  def index
    @creatures = Creature.all
    render :index
  end

  def new
    @creature = Creature.new
    render :new
  end

  def create
    creatures_params = params.require(:creature).permit(:name, :description)
    creature = Creature.new(creatures_params)

    if creature.save
      redirect_to creatures_path
    end
  end



end
