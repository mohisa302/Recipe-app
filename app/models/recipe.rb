class Recipe < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 250 }
  validates :description, presence: true
  validates :preparation_time, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :cooking_time, presence: true, numericality: { greater_than_or_equal_to: 0.0 }

  def owner?(user)
    self.user == user
  end
end
