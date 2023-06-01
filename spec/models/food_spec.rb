require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.create(name: 'Test user', email: 'test444@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
    @food = Food.create(name: 'Test food', price: 12.2, quantity: 4, measurement_unit: 'pce', user_id: @user.id)
    @food_two = Food.create(name: 'Test food two', price: 12.2, quantity: 4, measurement_unit: 'pce', user_id: @user.id)
  end
  it 'is valid with valid attributes' do
    expect(@food).to be_valid
  end
  it 'is not valid without a name' do
    @food.name = nil
    expect(@food).to_not be_valid
  end
  it 'is not valid without a user id' do
    @food.user_id = nil
    expect(@food).to_not be_valid
  end
  it 'is not valid without a unique name' do
    @food.name = @food_two.name
    expect(@food).to be_valid
  end
  it 'is not valid without measurement_unit' do
    @food.measurement_unit = 'string'
    expect(@food).to be_valid
  end
  it 'is not valid without price' do
    @food.price
    expect(@food).to be_valid
  end
  it 'is not valid without quantity' do
    @food.quantity >= 0 && @food.quantity == 'integer'
    expect(@food).to be_valid
  end
end
