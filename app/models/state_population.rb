class StatePopulation < ApplicationRecord

  def self.of(state)
    where(state: state).pluck(:population)
  end

end
