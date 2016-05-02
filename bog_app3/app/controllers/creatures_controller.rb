class CreaturesController < ApplicationController

  def index
    @creature = Creature.all
  end

  def new
    render :new
  end

  def create
    creature_params = params.require(:creature).permit(:name, :description)

    creature = Creature.new(creature_params)

    if creature.save
      redirect_to creatures_path
    end
  end
end
