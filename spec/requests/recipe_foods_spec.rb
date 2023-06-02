require 'rails_helper'

RSpec.describe 'RecipeFood', type: :request do
  before :each do
    @user = User.first
    @recipe = @user.recipes.first
    @recipe_food = @recipe.recipe_foods.first
    @food = @user.foods.first
    sign_in @user
  end

  after :each do
    sign_out @user
  end

  describe 'GET /users/[:user_id]/recipes/[:recipe_id]/recipe_foods/new' do
    it 'is valid response' do
      get new_user_recipe_recipe_food_path(user_id: @user.id, recipe_id: @recipe.id)
      expect(response).to have_http_status(200)
    end

    it 'renders correct template' do
      get new_user_recipe_recipe_food_path(user_id: @user.id, recipe_id: @recipe.id)
      expect(response).to render_template 'recipe_foods/new'
    end

    it 'response body has placeholder text' do
      get new_user_recipe_recipe_food_path(user_id: @user.id, recipe_id: @recipe.id)
      expect(response.body).to include('Add new Ingredient')
    end
  end

  describe 'POST /users/[:user_id]/recipes/[:recipe_id]/recipe_foods/' do
    it 'creates new recipe food for recipe' do
      post user_recipe_recipe_foods_path(user_id: @user.id, recipe_id: @recipe.id),
           params: { new_recipe_food: { quantity: 5, food_id: @food.id } }
      expect(@recipe.recipe_foods.count).to eql 2
    end
  end

  describe 'EDIT /users/[:user_id]/recipes/[:recipe_id]/recipe_foods/[:recipe_food_id]' do
    it 'is valid response' do
      get edit_user_recipe_recipe_food_path(user_id: @user.id, recipe_id: @recipe.id, id: @recipe_food.id)
      expect(response).to have_http_status(200)
    end

    it 'renders correct template' do
      get edit_user_recipe_recipe_food_path(user_id: @user.id, recipe_id: @recipe.id, id: @recipe_food.id)
      expect(response).to render_template 'recipe_foods/edit'
    end

    it 'response body has placeholder text' do
      get edit_user_recipe_recipe_food_path(user_id: @user.id, recipe_id: @recipe.id, id: @recipe_food.id)
      expect(response.body).to include('Modify Ingredient')
    end
  end

  describe 'DELETE /users/[:user_id]/recipes/[:recipe_id]/recipe_foods/[:recipe_food_id]' do
    it 'deletes recipe food for recipe' do
      delete user_recipe_recipe_food_path(user_id: @user.id, recipe_id: @recipe.id, id: @recipe_food.id)
      expect(@recipe.recipe_foods.count).to eql 1
    end
  end
end
