class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @foods = current_user.foods
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save!
        format.html { redirect_to recipes_path, notice: 'Recipe food has been added' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_foods).permit(:food_id, :quantity)
  end
end
 
