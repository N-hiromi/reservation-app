class User < ApplicationRecord
  has_many :rentals, dependent: :destroy
  has_many :reservations, dependent: :destroy
  validates :email, {presence: true, uniqueness: true}
  has_secure_password
end
