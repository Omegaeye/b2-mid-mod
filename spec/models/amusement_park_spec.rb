require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  it {should have_many(:rides)}
end
