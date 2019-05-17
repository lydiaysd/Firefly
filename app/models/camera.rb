class Camera < ApplicationRecord
  belongs_to :user
  has_many :rentals
  validates :name, presence: true
  validates :brand, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :availability, presence: true
end
