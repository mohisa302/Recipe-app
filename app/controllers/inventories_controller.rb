class InventoriesController < ApplicationController
  # load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @current_user = current_user
    @inventories = @current_user.inventories
  end

  def show; end
end
