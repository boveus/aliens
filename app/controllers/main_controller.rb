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

  def shape_by_state
    @state_shape_chart = state_shape_chart(params[:shape])
  end

  def per_capita_by_state
    @per_capita_by_state_chart = per_capita_state_chart
  end

  def dashboard
    @shapes = AlienSighting.all_shapes
  end

  def total_sightings_map
    @sightings = AlienSighting.get_alphabetical_count_by_state
  end

  def per_capita_map
    @sightings = AlienSighting.per_capita_sightings_hash
  end

  def comments
    @state, @sighting_comment = AlienSighting.random_comment
  end
end
