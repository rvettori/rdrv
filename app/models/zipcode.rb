class Zipcode < ApplicationRecord
  validates :state, :city, presence: true
  validates :state, length:{ is: 2}
end
