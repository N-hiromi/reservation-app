class AddUserReservationId < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reservation_id, :string
  end
end
