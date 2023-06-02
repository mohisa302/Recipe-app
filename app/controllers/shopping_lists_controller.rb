class ShoppingListsController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.where(user_id: @user.id)
    recipe_ids = @recipes.pluck(:id)
    r_foods = RecipeFood.where(recipe_id: recipe_ids).group(:food_id).sum(:quantity)
    @shopping_list = []

    r_foods.keys.each do |food_id|
      food = Food.find(food_id)
      needed_food = food.quantity - r_foods[food_id]
      next unless needed_food.negative?

      name = food.name
      needed = needed_food.abs
      price = needed * food.price
      @shopping_list << { name:, qty: needed, price: }
    end
  end
end
