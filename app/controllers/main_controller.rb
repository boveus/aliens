class MainController < ApplicationController
include ChartHandler
  def index
  end

  def dashboard
    @country_chart = country_chart
    @city_chart = city_chart
    @state_chart = state_chart
    @shape_chart = shape_chart
    @year_chart = year_chart
  end

  def map
    @all_sightings = AlienSighting.all
  end
end
