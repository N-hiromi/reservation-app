class User < ApplicationRecord
  has_many :rentals, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_one_attached :image
  validates :email, {presence: true, uniqueness: true}
  has_secure_password
end
