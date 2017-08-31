module ChartHandler
  def shape_chart
    shape_label, shape_data = AlienSighting.count_by_shape
    setup_chart(shape_label, shape_data, 'Reported Shapes')
  end

  def country_chart
    shape_label, shape_data = AlienSighting.count_by_country
    setup_chart(shape_label, shape_data, 'Sightings by country')
  end

  def setup_chart(data_label, chart_data, chart_label)
    {
    labels: data_label,
    datasets: [
      {
          label: chart_label,
          backgroundColor: "rgba(220,220,220,0.2)",
          borderColor: "rgba(220,220,220,1)",
          data: chart_data
      },
    ]
  }
  end
end
