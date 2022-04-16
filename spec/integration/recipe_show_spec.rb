require 'rails_helper'

RSpec.describe 'Recipe show page', type: :feature do
  describe 'recipe' do
    before :each do
      @user1 = User.create!(email: 'johndo@gmail.com', password: '123abc', name: 'John')
      @user2 = User.create!(email: 'janedoe@gmail.com', password: '123abc', name: 'Jane')
      @user3 = User.create!(email: 'peter@gmail.com', password: '123abc', name: 'Peter')

      visit '/users/sign_in'
      fill_in 'Email', with: 'johndo@gmail.com'
      fill_in 'Password', with: '123abc'
      click_button 'Log in'

      @recipe = @user1.recipes.create!(name: 'recipe test', cooking_time: '10mins', preparation_time: '10mins',
                                       description: 'test recipe')
      visit recipes_path
    end

    it 'should have the following content' do
      expect(page).to have_content('recipe test')
      expect(page).to have_content('test recipe')
      expect(page).to have_link('Remove')
    end

    it 'should link up to the show page' do
      click_link 'recipe test'
      expect(current_path).to eq(recipe_path(@recipe))
    end
  end

  describe 'recipe show' do
    before :each do
      @user1 = User.create!(email: 'johndo@gmail.com', password: '123abc', name: 'John')
      @user2 = User.create!(email: 'janedoe@gmail.com', password: '123abc', name: 'Jane')
      @user3 = User.create!(email: 'peter@gmail.com', password: '123abc', name: 'Peter')

      visit '/users/sign_in'
      fill_in 'Email', with: 'johndo@gmail.com'
      fill_in 'Password', with: '123abc'
      click_button 'Log in'

      @recipe = @user1.recipes.create!(name: 'recipe test', cooking_time: '10mins', preparation_time: '10mins',
                                       description: 'test recipe')
      visit recipe_path(@recipe)
    end

    it 'should have the following content' do
      expect(page).to have_content('recipe test')
      expect(page).to have_content('Preparation time: 10.0 min')
      expect(page).to have_content('Cooking time: 10.0 min')
      expect(page).to have_content('Public')
      expect(page).to have_content('No ingredients added yet. Please use the button above ☝️ to add a new ingredient')
    end
  end
end
