class Segment < ApplicationRecord
  validates :target, :description,  :query, presence:true
end
