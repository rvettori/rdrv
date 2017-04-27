require 'rails_helper'

RSpec.describe Zipcode, type: :model do
  it {is_expected.to validate_presence_of(:state)}
  it {is_expected.to validate_length_of(:state).is_equal_to(2)}
  it {is_expected.to validate_presence_of(:city)}
end
