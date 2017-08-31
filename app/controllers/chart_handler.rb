module ChartHandler
  def shape_chart
    shape_label, shape_data = AlienSighting.count_by_shape
    setup_chart(shape_label, shape_data, 'Reported Shapes')
  end

  def country_chart
    shape_label, shape_data = AlienSighting.count_by_country
    setup_chart(shape_label, shape_data, 'Sightings by country')
  end

  def city_chart
    city_label, city_data = AlienSighting.count_by_cities
    setup_chart(city_label, city_data, 'Sightings by US city')
  end

  def state_chart
    state_label, state_data = AlienSighting.count_by_state
    setup_chart(state_label, state_data, 'Sightings by US state')
  end

  def year_chart
    year_label, year_data = AlienSighting.count_by_year
    setup_chart(year_label, year_data, 'Sightings by year')
  end

  def setup_chart(data_label, chart_data, chart_label)
    {
    labels: data_label,
    datasets: [
      {
          label: chart_label,
          backgroundColor: "rgba(63,191,89,1)",
          borderColor: "rgba(0,0,0,1)",
          data: chart_data
      },
    ]
  }
  end
end
