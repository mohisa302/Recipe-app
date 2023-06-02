class InventoryFoodsController < ApplicationController
  def create

    @inventory_food = InventoryFood.find_by(inventory_id: inventory_food_params[:inventory_id], food_id: inventory_food_params[:food_id])

    if @inventory_food.present?
      @inventory_food.quantity += inventory_food_params[:quantity].to_i
    else
      @inventory_food = InventoryFood.new(inventory_food_params)
    end

    if @inventory_food.save
      flash[:success] = "Food added to inventory successfully!"
      redirect_to request.referrer
    else
      flash[:error] = "Failed to add food to inventory."
      redirect_to request.referrer
    end

  end

  private

  def inventory_food_params
    params.require(:post).permit(:food_id, :quantity, :inventory_id)
  end

  def food_exists_in_inventory?(inventory, food)
    InventoryFood.exists?(inventory: inventory, food: food)
  end
  
end
