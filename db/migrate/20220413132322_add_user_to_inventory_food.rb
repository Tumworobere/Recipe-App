class AddUserToInventoryFood < ActiveRecord::Migration[7.0]
  def change
    add_column :inventory_foods, :user, :integer
  end
end
