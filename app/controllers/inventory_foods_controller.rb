class InventoryFoodsController < ApplicationController
  load_and_authorize_resource

  def new
    @inventory_food = InventoryFood.new
  end

  def create
    @inventory_food = current_user.inventories.new(inventory_food_params)

    respond_to do |format|
      if @inventory_food.save
        format.html { redirect_to inventories_path, notice: 'Inventory food created successfully' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    authorize! :destroy, @inventory_food
    @inventory_food.destroy!

    respond_to do |format|
      format.html { redirect_to inventory_url, notice: 'Inventory food successfully deleted.' }
    end
  end

  private

  def inventory_params
    params.require(:inventory_food).permit(:food, :inventory, :quantity)
  end
end
