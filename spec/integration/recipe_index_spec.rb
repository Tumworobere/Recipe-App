require 'rails_helper'

RSpec.describe 'Users page', type: :feature do
  before :each do
    @user1 = User.create!(email: 'johndo@gmail.com', password: '123abc', name: 'John')
    @user2 = User.create!(email: 'janedoe@gmail.com', password: '123abc', name: 'Jane')
    @user3 = User.create!(email: 'peter@gmail.com', password: '123abc', name: 'Peter')

    visit '/users/sign_in'
    fill_in 'Email', with: 'johndo@gmail.com'
    fill_in 'Password', with: '123abc'
    click_button 'Log in'

    visit '/recipes'
  end

  it 'should have the following content' do
    expect(page).to have_content('Welcome, John')
    expect(page).to have_content('Recipe List')
    expect(page).to have_link('Foods')
    expect(page).to have_link('Recipies')
    expect(page).to have_link('Inventories')
    expect(page).to have_content('No recipies added yet. Please use the button above ☝️ to add a new recipe')
  end

  it 'should have the following content' do
    click_link 'Add Recipe'
    expect(current_path).to eq(new_recipe_path)
  end
end