require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  context 'associations' do
    it { should belong_to(:food).class_name('Food') }
    it { should belong_to(:inventory).class_name('Inventory') }
  end

  context 'values not empty' do
    it { should validate_presence_of(:quantity) }
  end

  context 'values should be numerical' do
    it do
      should validate_numericality_of(:quantity)
        .is_greater_than_or_equal_to(0)
    end
  end
end
