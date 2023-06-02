class InventoriesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @current_user = current_user
    @inventories = @current_user.inventories
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    authorize! :destroy, @inventory

    if @inventory.destroy
      flash[:success] = 'Inventory deleted successfully.'
    else
      flash[:error] = 'Failed to delete inventory.'
    end
    redirect_to inventories_path
  end

  def show
    @inventory = Inventory.find(params[:id])
    @foods = Food.all
    @current_user = current_user
    respond_to do |format|
      format.html
      format.xml { render xml: @post.comments }
      format.json { render json: @post.comments }
    end
  end

  def inventory_food_params
    params.require(:inventory_food).permit(:food_id, :quantity)
  end
end
