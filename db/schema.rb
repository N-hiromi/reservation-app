# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_31_063600) do

  create_table "keyids", force: :cascade do |t|
    t.string "user_id"
    t.string "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "room_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.string "room"
    t.text "address"
    t.integer "price"
    t.text "description"
    t.string "room_image"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "area"
    t.string "user_id"
    t.string "reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "user_name"
    t.date "check_in"
    t.date "check_out"
    t.integer "num_date"
    t.integer "num_people"
    t.integer "price"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "user_image"
    t.text "intro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_confirm"
    t.string "password_digest"
  end

end
