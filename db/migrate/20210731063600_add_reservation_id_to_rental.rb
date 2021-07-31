class AddReservationIdToRental < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :reservation_id, :string
  end
end
