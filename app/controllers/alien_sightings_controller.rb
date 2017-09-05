class AlienSightingsController < ApplicationController
  def new
    @sighting = AlienSighting.new
  end

  def create
    @sighting = AlienSighting.new(sighting_params)

    if @sighting.save
      flash[:success] = "Your sighting has been reported. Thank you for your report."
      redirect_to :dashboard
    else
      flash[:failure] = "FAILED TO CREATE REPORT - all fields except comments are required."
      render :new
    end
  end

  private
    def sighting_params
      params.require(:alien_sighting).permit(:date_posted, :city, :country, :shape, :duration_in_seconds, :comments)
    end
end
