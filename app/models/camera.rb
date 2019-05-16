class Camera < ApplicationRecord
  belongs_to :user
  has_many :rentals
  validations :name, presence: true
  validations :brand, presence: true
  validations :price, presence: true
  validations :description, presence: true
  validations :availability, presence: true
end
