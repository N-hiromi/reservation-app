class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_image
      t.text :intro

      t.timestamps
    end
  end
end
