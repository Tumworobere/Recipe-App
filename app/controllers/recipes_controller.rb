class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = current_user.recipes
  end

  def show
    @foods = current_user.foods
    @inventories = Inventory.all
    @recipe = current_user.recipes.includes(:recipe_foods).find(params[:id])
    @recipes = Recipe.find(params[:id])
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

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.public
      @recipe.update(public: false)
      flash.now[:notice] = 'You have updated the recipe status to private'
    else
      @recipe.update(public: true)
      flash.now[:notice] = 'You have updated the recipe status to public'
    end
    # redirect_to recipe_path
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
