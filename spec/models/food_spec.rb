require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'values not empty' do
    it { should validate_presence_of(:food) }
    it { should validate_presence_of(:measurement_unit) }
    it { should validate_presence_of(:unit_price) }
  end
end