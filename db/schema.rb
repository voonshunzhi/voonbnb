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

ActiveRecord::Schema.define(version: 2018_07_06_152030) do

  create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "name"
    t.integer "num_of_beds"
    t.float "price_per_night"
    t.integer "num_of_bath"
    t.integer "num_of_rooms"
    t.string "wifi", default: "no"
    t.string "kitchen", default: "no"
    t.string "washer", default: "no"
    t.string "dryer", default: "no"
    t.string "iron", default: "no"
    t.string "hair_dryer", default: "no"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "resident"
    t.string "poscode"
    t.string "street"
    t.string "house_number"
    t.string "status", default: "pending"
    t.integer "user_id"
    t.integer "sort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["sort_id"], name: "index_listings_on_sort_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "sorts", force: :cascade do |t|
    t.string "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.string "email", null: false
    t.string "image", default: "Ferrari-Logo.png"
    t.string "role", default: "user"
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
