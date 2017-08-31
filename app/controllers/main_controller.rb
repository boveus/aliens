class MainController < ApplicationController
include ChartHandler
  def index
  end

  def dashboard
    @country_chart = country_chart
    @city_counts = AlienSighting.count_by_cities
    @state_counts = AlienSighting.count_by_state
    @shape_chart = shape_chart
    @sightings_by_year = AlienSighting.count_by_year
  end

  def map
    @all_sightings = AlienSighting.all
  end
end
