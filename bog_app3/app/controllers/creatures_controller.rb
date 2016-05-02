class CreaturesController < ApplicationController

  def index
    @creature = Creature.all
  end

  def new
    @creature = Creature.new
    render :new
  end

  def create
    creature_params = params.require(:creature).permit(:name, :description)

    creature = Creature.new(creature_params)

    if creature.save
      redirect_to creature_path(creature)
    end
  end

  def show
    @creature = Creature.find_by_id(params[:id])
    render :show
  end

  def edit
    @creature = Creature.find_by_id(params[:id])
    render :edit
  end

  def update

    creature = Creature.find_by_id(params[:id])

    creature_params = params.require(:creature).permit(:name, :description)

    creature.update_attributes(creature_params)

    redirect_to creature_path(creature)
  end

  def destroy
    creature = Creature.find_by_id(params[:id])

    creature.destroy

    redirect_to creatures_path
  end
end
