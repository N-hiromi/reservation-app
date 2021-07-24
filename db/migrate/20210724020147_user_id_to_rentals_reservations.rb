class UserIdToRentalsReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :user_id, :string
    add_column :reservations, :user_id, :string
  end
end
