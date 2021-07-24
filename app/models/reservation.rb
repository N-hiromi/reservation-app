class Reservation < ApplicationRecord
    belongs_to :user, optional: true
    has_many :rentals, dependent: :destroy
    validates :user_name, {presence: true}
    validates :check_in, {presence: true}
    validates :check_out, {presence: true}
    validates :num_people, {presence: true}
end
