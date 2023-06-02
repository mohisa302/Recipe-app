class UsersController < ApplicationController
def index
    @current_user = current_user
    @inventories = current_user.inventories
    @user = User.all
    # Assign the first inventory if at least one inventory exists.
    @inventory = @inventories.first if @inventories.any?
  end

  def show
    if params[:id] == 'sign_out'
      sign_out_and_redirect
    else
      find_user
    end
  end

  private

  def sign_out_and_redirect
    sign_out current_user
    redirect_to new_user_session_path
  end
end
