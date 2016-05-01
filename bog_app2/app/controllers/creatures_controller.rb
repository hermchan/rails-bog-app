class CreaturesController < ApplicationController

  def index
    @creatures = Creature.all
  end

  def new
    render :new
  end









end
