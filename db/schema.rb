# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_24_200713) do
  create_table "messages", force: :cascade do |t|
    t.string "message"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "positions", force: :cascade do |t|
    t.integer "x", default: 0
    t.integer "y", default: 0
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_positions_on_user_id"
  end

  create_table "user_inventories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.boolean "glasses_3D", default: false
    t.boolean "chain_gold", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_inventories_on_user_id"
  end

  create_table "user_moneys", force: :cascade do |t|
    t.integer "quarters", default: 0
    t.integer "tickets", default: 0
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_moneys_on_user_id"
  end

  create_table "user_wearings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.boolean "glasses_3D", default: false
    t.boolean "chain_gold", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_wearings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "username"
    t.string "color", default: "red"
    t.string "location", default: "MainDistrict"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token", unique: true
  end

  add_foreign_key "messages", "users"
  add_foreign_key "positions", "users"
  add_foreign_key "user_inventories", "users"
  add_foreign_key "user_moneys", "users"
  add_foreign_key "user_wearings", "users"
end
