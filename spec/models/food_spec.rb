require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    @user = User.create(name: 'Jane Doe')
    @food = Food.create(name: 'flour', measurement_unit: 'grams', price: 2, quantity: 15, user_id: @user.id)
  end

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name should have valid value' do
    expect(subject.name).to eql 'flour'
  end

  it 'Measurement unit should have a valid value' do
    expect(subject.measurement_unit).to eql 'grams'
  end

  it 'Price should be present' do
    subject.price = -2
    expect(subject).to_not be_valid
  end

  it 'Quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end
end
