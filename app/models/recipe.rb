class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: :recipe_id, dependent: :destroy
  accepts_nested_attributes_for :recipe_foods
  validates :name, :preparationTime, :cookingTime, :description, presence: true
end
