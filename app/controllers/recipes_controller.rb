class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = current_user.recipes
  end

  def show
    @foods = current_user.foods
    @recipe = current_user.recipes.includes(:recipe_foods).find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipes_url, notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully deleted.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparationTime, :cookingTime, :description, :public)
  end
end
