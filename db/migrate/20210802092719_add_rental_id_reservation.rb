class AddRentalIdReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :rental_id, :string
  end
end
