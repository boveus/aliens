class AlienSightingsController < ApplicationController
  def index
    @aliensighting = AlienSighting.all
  end
  
  def show
    @aliensightings = AlienSighting.find(params[:id])
  end
end
