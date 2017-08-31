module DataHandler

  def shape_chart
    shape_label, shape_data = AlienSighting.count_by_shape
    {
    labels: shape_label,
    datasets: [
      {
          label: "Reported shapes",
          backgroundColor: "rgba(220,220,220,0.2)",
          borderColor: "rgba(220,220,220,1)",
          data: shape_data
      },
    ]
  }
  end
end
