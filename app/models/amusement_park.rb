class AmusementPark < ApplicationRecord
  has_many :rides

  def dollar_price
  '%.2f' % self.price
  end

  def average_thrill
    self.rides.average("thrill_rating")
  end
end
