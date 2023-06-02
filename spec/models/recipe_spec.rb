require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    user = User.first
    Recipe.new(
      name: 'test recipe1',
      preparation_time: 1.5,
      cooking_time: 1.0,
      description: 'lorum ipsum',
      public: true,
      user_id: user.id
    )
  end

  before { subject.save }
  describe 'check recipe validity' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  describe 'check recipe invalidity' do
    it 'is invalid with name missing' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'is invalid with description missing' do
      subject.description = nil
      expect(subject).to_not be_valid
    end
    it 'is invalid with preparation time missing' do
      subject.preparation_time = nil
      expect(subject).to_not be_valid
    end
    it 'is invalid with cooking time missing' do
      subject.cooking_time = nil
      expect(subject).to_not be_valid
    end
    it 'is invalid with preparation time negative' do
      subject.preparation_time = -1.0
      expect(subject).to_not be_valid
    end
    it 'is invalid with cooking time negative' do
      subject.cooking_time = -1.5
      expect(subject).to_not be_valid
    end
  end
  describe 'check recipe model functions' do
    it '#total_food_items' do
      RecipeFood.create(quantity: 2, recipe: subject, food: Food.first)
      expect(subject.total_food_items).to eql 1
    end
    it '#total_price' do
      RecipeFood.create(quantity: 2, recipe: subject, food: Food.first)
      expect(subject.total_price).to eql 3.0
    end

    it '#owner?' do
      expect(subject.owner?(User.first)).to be true
      expect(subject.owner?(User.second)).to be false
    end
  end
end
