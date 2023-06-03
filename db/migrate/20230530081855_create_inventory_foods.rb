class CreateInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_foods do |t|
      t.integer :quantity
      t.references :food, null: false, foreign_key: { to_table: :foods }
      t.references :inventory, null: false, foreign_key: { to_table: :inventories }

      t.timestamps
    end
  end
end
