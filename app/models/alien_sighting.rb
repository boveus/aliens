class AlienSighting < ApplicationRecord

  def location
    "#{city}, #{state}, #{country}"
  end
end
