class Camera < ApplicationRecord
  belongs_to :user
  has_many :rentals
  validates :name, presence: true
  validates :brand, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader
end
