class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @current_user = current_user
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    user = current_user
    recipe = Recipe.find(params[:recipe_id])
    recipe_food = RecipeFood.new({
                                   quantity: recipe_food_params['qty'],
                                   recipe_id: recipe.id,
                                   food_id: recipe_food_params['food_id']
                                 })
    if recipe_food.save
      flash[:success] = 'created successfully'
    else
      flash[:alert] = 'error creating recipe'
    end
    redirect_to user_recipe_path(user_id: user.id, id: recipe.id)
  end

  def edit
    @current_user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe_item = RecipeFood.find(params[:id])
    if @recipe_item.update_column(:quantity, update_food_params['qty'])
      flash[:success] = 'recipe food updated successfully'
      redirect_to user_recipe_path(user_id: params[:user_id], id: params[:recipe_id])
    else
      flash[:alert] = 'error updating recipe food'
    end
  end

  def destroy
    recipe_food = RecipeFood.find(params[:id])
    if recipe_food.destroy
      flash[:success] = 'recipe food deleted successfully'
      redirect_to user_recipe_path(user_id: params[:user_id], id: params[:recipe_id])
    else
      flash[:alert] = 'error deleting recipe food'
    end
  end

  private

  def recipe_food_params
    params.require(:new_recipe_food).permit(:food_id, :qty)
  end

  def update_food_params
    params.require(:update_recipe_food).permit(:qty)
  end
end
