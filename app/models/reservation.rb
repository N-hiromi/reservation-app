class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  has_one :rental, dependent: :destroy
  validates :check_in, {presence: true}
  validates :check_out, {presence: true}
  validates :num_people, {presence: true}
  def reserve_room
    return Rental.find_by(reservation_id: self.id)
  end
end
