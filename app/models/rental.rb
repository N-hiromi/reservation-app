class Rental < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :reservation, optional: true
  has_one_attached :image
  validates :address, {presence: true}
  validates :area, {presence: true}
  validates :price, {presence: true}
  validates :description, {presence: true}
end
