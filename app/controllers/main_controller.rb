class MainController < ApplicationController
  def index
  end

  def dashboard
    @country_counts = AlienSighting.count_by_country
    @city_counts = AlienSighting.count_by_cities
    @state_counts = AlienSighting.count_by_state
    @object_shape_counts = AlienSighting.count_by_shape
    @sightings_by_year = AlienSighting.count_by_year
  end

  def map
    @all_sightings = AlienSighting.all
  end
end
