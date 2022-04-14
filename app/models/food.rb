class Food < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods, foreign_key: :food_id, dependent: :destroy
  has_many :recipe_foods, foreign_key: :food_id, dependent: :destroy
  validates :food, :measurement_unit, :unit_price, presence: true
end
