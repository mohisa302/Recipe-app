require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  before :each do
    @user = User.first
    sign_in @user
  end
  after :each do
    sign_out @user
  end
  describe 'GET user/[:user_id]/recipes' do
    it 'is valid response' do
      get user_recipes_path(user_id: @user.id)
      expect(response).to have_http_status(200)
    end
    it 'renders correct template' do
      get user_recipes_path(user_id: @user.id)
      expect(response).to render_template 'recipes/index'
    end
    it 'response body has placeholder text' do
      get user_recipes_path(user_id: @user.id)
      expect(response.body).to include('Banana bread')
    end
  end

  describe 'GET user/[:user_id]/recipe/[:recipe_id]' do
    it 'is valid response' do
      get user_recipe_path(user_id: @user.id, id: @user.recipes.first.id)
      expect(response).to have_http_status(200)
    end
    it 'renders correct template' do
      get user_recipe_path(user_id: @user.id, id: @user.recipes.first.id)
      expect(response).to render_template 'recipes/show'
    end
    it 'response body has placeholder text' do
      get user_recipe_path(user_id: @user.id, id: @user.recipes.first.id)
      expect(response.body).to include('Banana bread')
    end
  end

  describe 'POST user/[:user_id]/recips/' do
    it 'creates a new recipe for the particular user' do
      post user_recipes_path(user_id: @user.id),
           params: { new_recipe: {
             name: 'MY recipe for chocolate shake',
             preparation_time: 0.25,
             cooking_time: 0.5,
             description: 'Simple steps to prepare chocolate milkshake',
             public: true
           } }
      expect(@user.recipes.count).to eql 3
    end
  end

  describe 'DELETE user/[:user_id]/recipe/[:recipe_id]' do
    it 'deletes a Recipe' do
      delete user_recipe_path(user_id: @user.id, id: @user.recipes.first.id)
      expect(@user.recipes.length).to eql 1
    end
  end
end
