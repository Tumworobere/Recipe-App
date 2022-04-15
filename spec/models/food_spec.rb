require 'rails_helper'

RSpec.describe Food, type: :model do
  
  context 'associations' do
    it { should belong_to(:user).class_name('User') }
  end

  context 'values not empty' do
    it { should validate_presence_of(:food) }
    it { should validate_presence_of(:measurement_unit) }
    it { should validate_presence_of(:unit_price) }
  end

  context 'values should be numerical' do
    it { should validate_numericality_of(:measurement_unit) }
    it { should validate_numericality_of(:unit_price) }
  end
end