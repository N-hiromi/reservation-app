class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.string :room
      t.text :address
      t.integer :price
      t.text :description
      t.string :room_image
      t.integer :owner_id

      t.timestamps
    end
  end
end
