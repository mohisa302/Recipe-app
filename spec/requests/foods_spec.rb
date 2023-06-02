require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  before :each do
    @user = User.first
    sign_in @user
  end

  after :each do
    sign_out @user
  end

  describe 'GET /users/:user_id/foods' do
    it 'is valid response' do
      get user_foods_path(user_id: @user.id)
      expect(response).to have_http_status(200)
    end

    it 'renders correct template' do
      get user_foods_path(user_id: @user.id)
      expect(response).to render_template 'foods/index'
    end

    it 'response body has placeholder text' do
      get user_foods_path(user_id: @user.id)
      expect(response.body).to include('Add food')
    end
  end

  describe 'GET /users/:user_id/foods/new' do
    it 'is valid response' do
      get new_user_food_path(user_id: @user.id)
      expect(response).to have_http_status(200)
    end

    it 'renders correct template' do
      get new_user_food_path(user_id: @user.id)
      expect(response).to render_template 'foods/new'
    end

    it 'response body has placeholder text' do
      get new_user_food_path(user_id: @user.id)
      expect(response.body).to include('Add a new food')
    end
  end

  describe 'POST /users/:user_id/foods/' do
    it 'creates a new food for user' do
      post user_foods_path(user_id: @user.id),
           params: { food: { name: 'wurst', measurement_unit: 'pieces', price: 1.0, quantity: 5, user_id: @user.id } }
      expect(@user.foods.count).to eql 4
    end
  end

  describe 'DELETE /users/:user_id/foods/:food_id' do
    it 'deletes a food for user' do
      food = @user.foods.last
      delete user_food_path(user_id: @user.id, id: food.id)
      expect(@user.foods.count).to eql 2
    end
  end
end
