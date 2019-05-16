class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cameras
  has_many :rentals
  validates :name, presence: true
  validates :bio, presence: true
  validates :location, presence: true
  validates :phone_number, presence: true
end
