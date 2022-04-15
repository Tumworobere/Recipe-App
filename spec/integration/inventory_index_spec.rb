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

    visit '/inventories'
  end

  it 'should have the following content' do
    expect(page).to have_content('Welcome, John')
    expect(page).to have_content('Inventory List')
    expect(page).to have_link('Foods')
    expect(page).to have_link('Recipies')
    expect(page).to have_link('Inventories')
    expect(page).to have_content('No inventories added yet. Please use the button above ☝️ to add new inventory')
  end

  it 'should link up to page to add new inventory' do
    click_link 'Add Inventory'
    expect(current_path).to eq(new_inventory_path)
  end

  it 'should link up to the recipies list page' do
    click_link 'Recipies'
    expect(current_path).to eq(recipes_path)
  end

  it 'should link up the foods list page' do
    click_link 'Foods'
    expect(current_path).to eq(foods_path)
  end
end