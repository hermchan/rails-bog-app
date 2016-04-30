class CreaturesController < ApplicationController

  def index
    @creatures = Creature.all
    render :index
  end

  def new
    @creature = Creature.new
    render :new
  end

  def show
    @creature = Creature.find_by_id(params[:id])
    render :show
  end

  def create
    creatures_params = params.require(:creature).permit(:name, :description)
    creature = Creature.new(creatures_params)

    if creature.save
      redirect_to creature_path(creature)
    end
  end

  def edit
    @creature = Creature.find_by_id(params[:id])
    render :edit
  end

  def update
       # get the creature id from the url params
       creature_id = params[:id]

       # use `creature_id` to find the creature in the database
       # and save it to an instance variable
       creature = Creature.find_by_id(creature_id)

       # whitelist params and save them to a variable
       creature_params = params.require(:creature).permit(:name, :description)

       # update the creature
       creature.update_attributes(creature_params)

       # redirect to show page for the updated creature
       redirect_to creature_path(creature)
       # redirect_to creature_path(creature) is equivalent to:
       # redirect_to "/creatures/#{creature.id}"
  end

  def destroy
    creature = Creature.find_by_id(params[:id])

    creature.destroy

    redirect_to creatures_path
  end

end
