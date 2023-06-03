require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET /users/:user_id/foods' do
    it 'is valid response' do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get user_foods_path(user_id: user.id)
      expect(response).to have_http_status(200)
      delete destroy_user_session_path
    end

    it 'renders correct template' do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get user_foods_path(user_id: user.id)
      expect(response).to render_template 'foods/index'
      delete destroy_user_session_path
    end

    it 'response body has placeholder text' do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get user_foods_path(user_id: user.id)
      expect(response.body).to include('Add food')
      delete destroy_user_session_path
    end
  end

  describe 'GET /users/:user_id/foods/new' do
    it 'is valid response' do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get new_user_food_path(user_id: user.id)
      expect(response).to have_http_status(200)
      delete destroy_user_session_path
    end

    it 'renders correct template' do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get new_user_food_path(user_id: user.id)
      expect(response).to render_template 'foods/new'
      delete destroy_user_session_path
    end

    it 'response body has placeholder text' do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get new_user_food_path(user_id: user.id)
      expect(response.body).to include('Add a new food')
      delete destroy_user_session_path
    end
  end

  describe 'POST /users/:user_id/foods/' do
    it 'creates a new food for user' do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      expect do
        post user_foods_path(user_id: user.id),
             params: { food: { name: 'wurst', measurement_unit: 'pieces', price: 1.0, quantity: 5, user_id: user.id } }
      end.to change { user.foods.count }.by(1)
      delete destroy_user_session_path
    end
  end

  describe 'DELETE /users/:user_id/foods/:food_id' do
    it 'deletes a food for user' do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      food = FactoryBot.create(:food, user:)
      expect do
        delete user_food_path(user_id: user.id, id: food.id)
      end.to change { user.foods.count }.by(-1)
      delete destroy_user_session_path
    end
  end
end
