class AreaToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :area, :string
  end
end
