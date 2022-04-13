class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end

  def create
    # @food = Food.find(params[:food_id])
    @recipe = Food.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_path(@recipe), notice: 'Recipe food was added' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food, :recipe, :quantity)
  end
end