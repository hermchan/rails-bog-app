class CreaturesController < ApplicationController

  def index
    @creature = Creature.all
  end


end
