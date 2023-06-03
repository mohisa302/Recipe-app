require 'rails_helper'
require 'factory_bot'

RSpec.describe 'User authentication', type: :request do
  let(:user) { FactoryBot.create(:user, confirmed_at: nil) }

  describe 'GET /users/sign_in' do
    it 'redirects to sign in page' do
      get new_user_session_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Log in')
    end
  end

  describe 'POST /users/sign_in' do
    context 'with valid credentials and confirmed email' do
      it 'logs the user in' do
        user = FactoryBot.create(:user, confirmed_at: Time.now)
        get new_user_confirmation_path, params: { confirmation_token: user.confirmation_token }
        @token = user.confirmation_token
        post user_session_path, params: { user: { email: user.email, password: user.password } }
        expect(response).to redirect_to(root_path)
        follow_redirect!
        expect(response).to have_http_status(:success)
        expect(response.body).to include('Signed in successfully')
      end
    end

    context 'with invalid credentials' do
      it 'does not log the user in' do
        user = FactoryBot.create(:user)
        post user_session_path, params: { user: { email: user.email, password: 'invalid' } }
        expect(response).to have_http_status(422)
        expect(response.body).to include('Invalid Email or password.')
      end
    end

    context 'with unconfirmed email' do
      it 'does not log the user in' do
        post user_session_path, params: { user: { email: user.email, password: user.password } }
        expect(response).to have_http_status(302)
        expect(response.body).to include('redirected')
      end
    end
  end

  describe 'GET /users/confirmation' do
    it "confirms the user's email" do
      get user_confirmation_path(confirmation_token: user.confirmation_token)
      expect(response).to redirect_to(new_user_session_path)
      follow_redirect!
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Your email address has been successfully confirmed')
    end
  end
end
