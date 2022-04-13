class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :preparationTime
      t.decimal :cookingTime
      t.text :description
      t.boolean :public, :default => true

      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
