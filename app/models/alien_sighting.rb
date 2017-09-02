class AlienSighting < ApplicationRecord

  def location
    "#{city}, #{state}, #{country}"
  end

  def self.random_comment
    find(rand(80332)).comments
  end

  def self.sort_by_duration
    order("duration_in_seconds DESC")
  end

  def self.longest
    sort_by_duration
    .first
  end

  def self.shortest
    sort_by_duration
    .last
  end

  def self.count_by_shape
    format_for_chart(
    group(:shape)
    .order("count(shape) DESC")
    .count
    .first(29)
    )
  end

  def self.shape_by_country(shape)
    where(shape: shape)
    .group(:country)
    .count
  end

  def self.shape_by_state(shape)
    format_for_chart(
    where(shape: shape, country: 'us')
    .group(:state)
    .order("count(state) DESC")
    .count
    )
  end

  def self.count_by_country
    format_for_chart(
    group(:country)
    .order("count(country) DESC")
    .count
    .first(5)
    )
  end

  def self.count_by_cities(country = 'us', number = 10)
    format_for_chart(
    where(country: country)
    .group(:city)
    .order("count(city) DESC")
    .count(:id)
    .first(number))
  end

  def self.count_by_state(number = 10)
    format_for_chart(
    group(:state)
    .order("count(state) DESC")
    .count(:id)
    .first(number))
  end

  def self.all_states
    distinct.pluck(:state)
  end

  def self.all_shapes
    distinct.pluck(:shape)
  end

  def self.count_by_year(number = 10)
    format_for_chart(
    group("DATE_TRUNC('year', date_posted)")
    .order("count(date_posted) DESC")
    .count(:id)
    .first(number))
  end

  def self.count_by_month(number = 10)
    group("DATE_TRUNC('month', date_posted)")
    .order("count(date_posted) DESC")
    .count(:id)
    .first(number)
  end

  def self.format_for_chart(data_table)
    labels = []
    data = []
    data_table.each do |nested_array|
      labels << nested_array[0]
      data << nested_array[1]
    end
    return labels, data
  end
end
