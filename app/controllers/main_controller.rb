class MainController < ApplicationController
  def index
  end

  def dashboard
    @country_counts = AlienSighting.count_by_country
    @city_counts = AlienSighting.count_by_cities
    @state_counts = AlienSighting.count_by_state
    @object_shape_counts = AlienSighting.count_by_shape
  end

  def map
  end
end
