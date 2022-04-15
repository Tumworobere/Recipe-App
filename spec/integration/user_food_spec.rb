require 'rails_helper'

RSpec.describe 'User foods page', type: :feature do
  before :each do
    @user1 = User.create!(email: 'johndo@gmail.com', password: '123abc', name: 'John')
    @user2 = User.create!(email: 'janedoe@gmail.com', password: '123abc', name: 'Jane')
    @user3 = User.create!(email: 'peter@gmail.com', password: '123abc', name: 'Peter')

    visit '/users/sign_in'
    fill_in 'Email', with: 'johndo@gmail.com'
    fill_in 'Password', with: '123abc'
    click_button 'Log in'

    visit '/foods'
  end

  it 'should have the following content' do
    expect(page).to have_content('Welcome, John')
    expect(page).to have_content('Food List')
    expect(page).to have_link('Foods')
    expect(page).to have_link('Recipies')
    expect(page).to have_content('No foods added yet. Please use the button above ☝️ to add a new food')
  end

  it 'should have the following content' do
    click_link 'Add Food'
    expect(current_path).to eq(new_food_path)
  end
end