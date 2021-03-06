require 'rails_helper'

RSpec.describe Segment, type: :model do
  it{ is_expected.to validate_presence_of(:target)}
  it{ is_expected.to validate_presence_of(:description)}
  it{ is_expected.to validate_presence_of(:query)}
end
