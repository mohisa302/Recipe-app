class AddPriceToFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :price, :integer
  end
end
