class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods, foreign_key: :inventory_id, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :description, length: { maximum: 250 }
end
