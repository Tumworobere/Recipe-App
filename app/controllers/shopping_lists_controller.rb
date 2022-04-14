class ShoppingListsController < ApplicationController
  def index
    @inventory = Inventory.find(4)
    @foods = @inventory.inventory_foods.includes(:food)
  end
end
