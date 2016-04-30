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
      redirect_to creatures_path(creature)
    end
  end

  # def create
  #    # whitelist params and save them to a variable
  #    creature_params = params.require(:creature).permit(:name, :description)
  #
  #    # create a new creature from `creature_params`
  #    creature = Creature.new(creature_params)
  #
  #    # if creature saves, redirect to route that displays
  #    # ONLY the newly created creature
  #    if creature.save
  #      redirect_to creature_path(creature)
  #      # redirect_to creature_path(creature) is equivalent to:
  #      # redirect_to "/creatures/#{creature.id}"
  #    end
  # end

  def edit
    @creature = Creature.find_by_id(params[:id])
    render :edit
  end




end
