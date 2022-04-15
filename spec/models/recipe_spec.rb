require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  context 'associations' do
    it { should belong_to(:food).class_name('Food') }
    it { should belong_to(:recipe).class_name('Recipe') }
  end
end