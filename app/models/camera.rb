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

  include PgSearch
  pg_search_scope :search_cameras,
    against: [ :name, :brand, :price, :address, :start_date, :end_date],
    using: {
      tsearch: { prefix: true }
    }
end
