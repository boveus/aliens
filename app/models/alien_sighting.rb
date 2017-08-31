class AlienSighting < ApplicationRecord

  def location
    "#{city}, #{state}, #{country}"
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
    group(:shape)
    .count
  end

  def self.shape_by_country(shape)
    where(shape: shape)
    .group(:country)
    .count
  end

  def self.count_by_country
    group(:country).count
  end

  def self.count_by_cities(country = 'us', number = 10)
    where(country: country)
    .group(:city)
    .order("count(city) DESC")
    .count(:id)
    .first(number)
  end

  def self.count_by_state(number = 10)
    group(:state)
    .order("count(state) DESC")
    .count(:id)
    .first(number)
  end

  def self.count_by_year
    # select(date_trunc('year', date_posted))
    # .group_by(date_posted)
  end
end
