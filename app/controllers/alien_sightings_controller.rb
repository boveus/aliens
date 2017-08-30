class AlienSightingsController < ApplicationController
  def index
    @aliensightings = AlienSighting.all
  end

  def show
    @sighting = AlienSighting.find(params[:id])
  end
end
