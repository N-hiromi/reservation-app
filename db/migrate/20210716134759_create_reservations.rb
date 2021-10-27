class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.date :check_in
      t.date :check_out
      t.integer :num_date
      t.integer :num_people
      t.integer :price
      t.integer :total
      t.integer :rental_id

      t.timestamps
    end
  end
end
