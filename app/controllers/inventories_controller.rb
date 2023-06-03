class InventoriesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @current_user = current_user
    @inventories = @current_user.inventories
  end

  def new
    @user = current_user
  end

  def create
    inventory = Inventory.new(inventory_params)
    if inventory.save
      flash[:success] = 'Inventory created successfully'
    else
      flash[:error] = inventory.errors.full_messages.join('. ')
    end
    redirect_to inventories_path
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
    @inventory_foods = InventoryFood.where(inventory_id: @inventory.id)
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

  def inventory_params
    params.require(:new_inventory).permit(:user_id, :name, :description)
  end
end
