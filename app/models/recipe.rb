class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: :recipe_id, dependent: :destroy
  accepts_nested_attributes_for :recipe_foods
  validates :name, :preparationTime, :cookingTime, :description, presence: true

  def self.compute_total_amount(recipe)
    total_amount = 0
    recipe.recipe_foods.each do |recipe_food|
      food = recipe_food.food
      total_amount += recipe_food.quantity * food.unit_price
    end
    total_amount
  end
end
