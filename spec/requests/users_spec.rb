require 'rails_helper'

RSpec.describe 'UserRequests', type: :request do
  before :each do
    @user = User.first
    sign_in @user
  end

  after :each do
    sign_out @user
  end

  describe 'GET /users' do
    it 'is valid response' do
      get users_path(user_id: @user.id)
      expect(response).to have_http_status(200)
    end
    it 'renders correct template' do
      get users_path(user_id: @user.id)
      expect(response).to render_template 'users/index'
    end
    it 'response body has placeholder text' do
      get users_path(user_id: @user.id)
      expect(response.body).to include('logged as : J. kent')
    end
  end
end
