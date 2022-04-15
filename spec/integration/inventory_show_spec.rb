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

      @inventory = @user1.inventories.create!(name: 'inventory test', description: "test inventory")
      visit inventories_path
    end

    it "should have the following content" do
      expect(page).to have_content('inventory test')
      expect(page).to have_content('test inventory')
      expect(page).to have_link('Remove')
    end

    it 'should link up to the show page' do
      click_link 'inventory test'
      expect(current_path).to eq(inventory_path(@inventory))
    end
  end

end