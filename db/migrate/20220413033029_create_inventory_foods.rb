class CreateInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_foods do |t|
      t.bigint :quantity
      t.references :inventory, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
