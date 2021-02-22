class Mechanic < ApplicationRecord
  has_many :mechanic_rides, :dependent => :destroy
  has_many :rides, through: :mechanic_rides

  def self.average_yr_experience
    average(:years_experience)
  end

  def rides_work
      self.rides.where(open: true).order("thrill_rating DESC")
  end
end
