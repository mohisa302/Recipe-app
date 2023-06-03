class Inventory < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
  has_many :inventory_foods, dependent: :destroy
  has_many :foods, through: :inventory_foods, dependent: :destroy
=======
  has_many :inventory_foods
  has_many :foods, through: :inventory_foods
>>>>>>> a7a0838efc69e3d1cb0918a91eb7ecd542f90ec1
end
