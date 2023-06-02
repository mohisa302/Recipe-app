class ShoppingListController < ApplicationController
  def make_list
    recipe = recipe = Recipe.find(params[:recipe_id])
    #find all the food which belong to this recipe
    @recipe_foods = RecipeFood.where(recipe_id: params[:inventory_id])
    
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_foods = InventoryFood.where(inventory_id: params[:inventory_id])
    @shopping_list_foods = []
    @total_food_price = 0;
    @recipe_foods.each do |recipe_food|
      if @inventory_foods.find_by(food_id: recipe_food.food_id)
        inventory_food = @inventory_foods.find_by(food_id: recipe_food.food_id)
        if inventory_food.quantity < recipe_food.quantity 
          quantity_needed = recipe_food.quantity  - inventory_food.quantity
          recipe_food.quantity = quantity_needed
          @shopping_list_foods.push(recipe_food)
          @total_food_price = recipe_food.quantity * recipe_food.price
        end
      else
        @shopping_list_foods.push(recipe_food)
        @total_food_price = recipe_food.quantity * recipe_food.price
      end
    end
    @total_food_items = @shopping_list_foods.sum(&:quantity)
  end
end
