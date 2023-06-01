class Recipe < ApplicationRecord
  belongs_to :user
  
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods
  
  validates :name, presence: true, length: { maximum: 250 }
  validates :description, presence: true
  validates :preparation_time, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :cooking_time, presence: true, numericality: { greater_than_or_equal_to: 0.0 }

  def owner?(user)
    self.user == user
  end

end
