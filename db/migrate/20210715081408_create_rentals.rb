class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.string :room
      t.text :address
      t.string :area
      t.integer :price
      t.text :description
      t.integer :owner_id
      t.integer :user_id

      t.timestamps
    end
  end
end
