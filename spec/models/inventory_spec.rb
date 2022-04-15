require 'rails_helper'

RSpec.describe Inventory, type: :model do
  context 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:inventory_foods)}
  end

  context 'values not empty' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

  context 'length' do
    it { should validate_length_of(:description).is_at_most(250) }
  end
end
