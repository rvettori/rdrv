class Zipcode < ApplicationRecord
  validates :state, :city, presence: true
  validates :state, length:{ is: 2}

  def to_s
    "#{code} - #{street} - #{city} - #{state}"
  end
end
