class Contact < ApplicationRecord
  belongs_to :zipcode
  belongs_to :occupation

  validates :name, :email, :born_at, :nationality, presence:true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validate :validate_born_at

  private

  def validate_born_at
    if self.born_at and self.born_at >= (Date.today - 16.years)
      errors.add(:born_at, 'born must be greatter then equal 16 years') 
    end
  end
end
