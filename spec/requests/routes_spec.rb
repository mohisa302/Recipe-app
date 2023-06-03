require 'rails_helper'

RSpec.describe 'Routes', type: :routing do
  let(:user) { FactoryBot.create(:user) }

  describe 'POST /inventory_foods' do
    it 'routes to inventory_foods#create' do
      post user_session_path(user: { email: user.email, password: user.password })
      post inventory_foods_path
      response = subject
      expect(response).to have_http_status(302)
      delete destroy_user_session_path
    end
  end

  describe 'DELETE /inventory_foods' do
    it 'routes to inventory_foods#destroy' do
      post user_session_path(user: { email: user.email, password: user.password })
      delete inventory_foods_path
      response = subject
      expect(response).to have_http_status(302)
      delete destroy_user_session_path
    end
  end

  describe 'POST /inventories' do
    it 'routes to inventories#create' do
      post user_session_path(user: { email: user.email, password: user.password })
      post inventories_path
      response = subject
      expect(response).to have_http_status(302)
      delete destroy_user_session_path
    end
  end

  describe 'GET /shopping_list/index' do
    it 'routes to shopping_list#index' do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get shopping_list_index_path
      response = subject
      expect(response).to have_http_status(200)
      delete destroy_user_session_path
    end
  end

  describe 'GET /users/:user_id/recipes/:recipe_id/generate_shopping_list' do
    it 'routes to recipes#generate_shopping_list' do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get generate_shopping_list_user_recipe_path(user_id: user.id, recipe_id: 1)
      response = subject
      expect(response).to have_http_status(200)
      delete destroy_user_session_path
    end
  end

  describe 'POST /users/:user_id/recipes/:recipe_id/make_list' do
    it 'routes to recipes#make_list' do
      post user_session_path(user: { email: user.email, password: user.password })
      post make_list_user_recipe_path(user_id: user.id, recipe_id: 1)
      response = subject
      expect(response).to have_http_status(302)
      delete destroy_user_session_path
    end
  end

  describe 'GET /users/:user_id/shopping_list/new' do
    it 'routes to shopping_list#new' do
      post user_session_path(user: { email: user.email, password: user.password })
      get new_user_shopping_list_path(user_id: user.id)
      response = subject
      expect(response).to have_http_status(200)
      delete destroy_user_session_path
    end
  end

  describe 'GET /public_recipes' do
    it 'routes to public_recipes#index' do
      post user_session_path(user: { email: user.email, password: user.password })
      get public_recipes_path
      response = subject
      expect(response).to have_http_status(200)
      delete destroy_user_session_path
    end
  end

  describe 'GET /public_recipes/:id' do
    it 'routes to public_recipes#show' do
      post user_session_path(user: { email: user.email, password: user.password })
      get public_recipe_path(id: 1)
      response = subject
      expect(response).to have_http_status(200)
      delete destroy_user_session_path
    end
  end

  describe 'GET /recipes/:recipe_id/new' do
    it 'routes to shopping_list#new_user_recipe_shopping_list' do
      post user_session_path(user: { email: user.email, password: user.password })
      get new_user_recipe_shopping_list_path(recipe_id: 1)
      response = subject
      expect(response).to have_http_status(200)
      delete destroy_user_session_path
    end
  end
end
