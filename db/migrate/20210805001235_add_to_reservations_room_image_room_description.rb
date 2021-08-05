class AddToReservationsRoomImageRoomDescription < ActiveRecord::Migration[5.2]
  def change
     add_column :reservations, :room, :string
     add_column :reservations, :room_image, :string
     add_column :reservations, :description, :string
  end
end
