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

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Inventory food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def inventory_food_params
    params.require(:post).permit(:food_id, :quantity, :inventory_id)
  end

  
end
