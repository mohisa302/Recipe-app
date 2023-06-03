require 'rails_helper'

RSpec.describe 'InventoriesController', type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe 'POST /inventories' do
    it 'creates a new inventory' do
      post user_session_path(user: { email: user.email, password: user.password })
      post '/inventories',
           params: { new_inventory: { name: 'Test Inventory', description: 'placeholder description',
                                      user_id: user.id } }
      expect(response).to redirect_to(inventories_path)
      expect(Inventory.last.name).to eq('Test Inventory')
    end
  end

  describe 'POST /inventories' do
    it 'creates a new inventory' do
      post user_session_path(user: { email: user.email, password: user.password })
      post '/inventories',
           params: { new_inventory: { name: 'Test Inventory', description: 'placeholder description',
                                      user_id: user.id } }
      expect(response).to have_http_status(302)
    end
  end
end
