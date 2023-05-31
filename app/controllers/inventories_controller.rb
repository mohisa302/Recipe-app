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
      flash[:success] = "Inventory deleted successfully."
      redirect_to inventories_path
    else
      flash[:error] = "Failed to delete inventory."
      redirect_to inventories_path
    end
  end


  def show; end
end
