require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    Recipe.new(name: 'Soup', preparation_time: 10, cooking_time: 12, description: 'detail description goes here',
               public: true)
  end

  it 'validates presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'validates presence of preparation_time' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end
  it 'validates presence of cooking_time' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end
  it 'validates presence of description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'validates presence of public' do
    subject.public = nil
    expect(subject).to_not be_valid
  end
  it 'validates that preparation_time is an integer' do
    subject.preparation_time = 'string'
    expect(subject).to_not be_valid
  end

  it 'validates preparation_time greater than or equal to 0' do
    subject.preparation_time = -1
    expect(subject).to_not be_valid
  end
  it 'validates that cooking_time is an integer' do
    subject.cooking_time = 'string'
    expect(subject).to_not be_valid
  end

  it 'validates cooking_time greater than or equal to 0' do
    subject.cooking_time = -1
    expect(subject).to_not be_valid
  end
  it 'validates public not to be number' do
    subject.public = -1
    expect(subject).to_not be_valid
  end
  it 'validates public not to be string' do
    subject.public = 'string'
    expect(subject).to_not be_valid
  end
end
