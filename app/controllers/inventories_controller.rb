class InventoriesController < ApplicationController

  def index
    @inventories = Inventory.all
  end
end
