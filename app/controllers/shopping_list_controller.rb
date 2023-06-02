class ShoppingListController < ApplicationController
  def make_list
    @recipe_foods = recipe_foods(params[:recipe_id])
    @inventory_foods = InventoryFood.where(inventory_id: params[:inventory_id])
    @shopping_list_foods = []
    @total_food_price = 0
    @recipe_foods.each do |recipe_food|
      if @inventory_foods.find_by(food_id: recipe_food.food_id)
        inventory_food = @inventory_foods.where(food_id: recipe_food.food_id)
        if inventory_food.sum(:quantity) < recipe_food.quantity
          quantity_needed = recipe_food.quantity - inventory_food.sum(:quantity)
          recipe_food.quantity = quantity_needed
          @shopping_list_foods.push(recipe_food)
          @total_food_price += recipe_food.quantity * Food.find_by(id: recipe_food.food_id).price
        end
      else
        @shopping_list_foods.push(recipe_food)
        @total_food_price += recipe_food.quantity * Food.find_by(id: recipe_food.food_id).price
      end
    end
    @total_food_items = @shopping_list_foods.sum(&:quantity)
  end

  def new
    @inventories = current_user.inventories.all
    @recipe_id = params[:recipe_id]
  end

  def generate_shopping_list
    redirect_to make_list_path(recipe_id: params[:recipe_id], inventory_id: params[:inventory_id])
  end

  private

  def recipe_foods(recipe_id)
    RecipeFood
      .select(:food_id, 'SUM(quantity) as quantity')
      .where(recipe_id:)
      .group(:food_id)
  end
end
