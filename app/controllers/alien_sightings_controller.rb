class AlienSightingsController < ApplicationController
  def show
    @aliensightings = AlienSighting.where(city: "holbrook")
  end
end
