class AlienSighting < ApplicationRecord
  validates :date_posted, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :shape, presence: true
  validates :duration_in_seconds, presence: true

  def location
    "#{city}, #{state}, #{country}"
  end

  def year
    date_posted.to_time.year
  end

  def self.random_sighting
    sighting = find(rand(80332))
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

  def self.by_hour_of_day
    format_for_chart(
    group("date_part('hour', date_posted)")
    .count(:id)
    .sort)
  end

  def self.shape_by_state(shape)
    format_for_chart(
    where(shape: shape, country: 'us')
    .group(:state)
    .order("count(state) DESC")
    .count(:id)
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

  def self.get_count_by_cities(country = 'us', number = 10)
    where(country: country)
    .group(:city)
    .order("count(city) DESC")
    .count(:id)
    .first(number)
  end

  def self.count_by_cities(country = 'us', number = 10)
    format_for_chart(get_count_by_cities(country, number))
  end

  def self.get_count_by_state(number = 10)
    group(:state)
    .order("count(state) DESC")
    .count(:id)
    .first(number)
  end

  def self.count_by_state(number = 10)
    format_for_chart(get_count_by_state(number))
  end

  def self.all_states
    distinct.pluck(:state)
  end

  def self.all_shapes
    distinct.pluck(:shape)
  end

  def self.all_countries
    distinct.pluck(:country)
  end

  def self.top_five_dates_by_count
    group("date_trunc('day', date_posted)")
    .order("count(date_posted) DESC")
    .count(:id)
    .first(5)
  end

  def self.calculate_count_by_year(number = 10)
    group("date_part('year', date_posted)")
    .order("count(date_posted) DESC")
    .count(:id)
    .first(number)
  end

  def self.count_by_year(number = 10)
    format_for_chart(calculate_count_by_year(number))
  end

  def self.count_by_month(number = 10)
    group("DATE_TRUNC('month', date_posted)")
    .order("count(date_posted) DESC")
    .count(:id)
    .first(number)
  end

  def self.get_count_by_state(number = 10)
    where(country: 'us')
    .group(:state)
    .order("count(state) DESC")
    .count(:id)
    .first(number)
  end

  def self.get_alphabetical_count_by_state
    where(country: 'us')
    .group(:state)
    .order("state ASC")
    .count(:id)
  end

  def self.get_per_capita_sightings_by_state(number = 50)
    per_capita_hash = {}
    state_sightings = get_count_by_state(number)
    state_sightings.each do |sighting_count|
      state = sighting_count[0]
      count = sighting_count[1]
      per_capita_hash[state] = (count / StatePopulation.of(state).first.to_f).round(6)
    end
    per_capita_hash = Hash[per_capita_hash.sort_by{|k, v| v}.reverse]
    labels = []
    data = []
    per_capita_hash.each do |key, value|
      labels << key
      data << value
    end
    return labels, data
  end

  def self.per_capita_sightings_hash
    per_capita_hash = {}
    state_sightings = get_count_by_state(50)
    state_sightings.each do |sighting_count|
      state = sighting_count[0]
      count = sighting_count[1]
      per_capita_hash[state] = (count / StatePopulation.of(state).first.to_f).round(6)
    end
    per_capita_hash = Hash[per_capita_hash.sort_by{|k, v| v}.reverse]
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
