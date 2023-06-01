class InventoryFoodsController < ApplicationController
  def create
    @inventory_food = InventoryFood.new(inventory_food_params)

    if @inventory_food.save
      @inventory = Inventory.find(params[:id])
      flash[:success] = "Food added to inventory successfully!"
      redirect_to @inventory
    else
      @inventory = Inventory.find(params[:id])
      flash[:error] = "Failed to add food to inventory."
      redirect_to @inventory
    end
  end

  private

  def inventory_food_params
    params.require(:post).permit(:food_id, :quantity, :inventory_id)
  end
end
