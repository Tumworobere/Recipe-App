require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:recipe_foods)}
  end

end