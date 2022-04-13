class InventoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
    @foods =  @inventory.inventory_foods.includes(:food)
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = current_user.inventories.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventories_path, notice: 'Inventory created successfully' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    authorize! :destroy, @inventory
    @inventory.destroy!

    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'Inventory successfully deleted.' }
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
