class AlienSighting < ApplicationRecord

  def location
    "#{city}, #{state}, #{country}"
  end

  def self.sort_by_duration
    order("duration_in_seconds DESC")
  end

  def self.longest
    sort_by_duration.first
  end

  def self.shortest
    sort_by_duration.last
  end

  def self.count_by_shape
    group(:shape).count
  end

  def self.shape_by_country(shape)
    where(shape: shape)
    .group(:country).count
  end
end
