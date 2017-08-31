class MainController < ApplicationController
include ChartHandler
  def index
  end

  def shapes
    @shape_chart = shape_chart
  end

  def countries
    @country_chart = country_chart
  end

  def cities
    @city_chart = city_chart
  end

  def states
    @state_chart = state_chart
  end

  def years
    @year_chart = year_chart
  end

  def dashboard
  end

  def map
    @all_sightings = AlienSighting.all
  end
end
