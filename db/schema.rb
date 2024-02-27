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

ActiveRecord::Schema[7.0].define(version: 2024_02_27_103620) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "competition_classes", force: :cascade do |t|
    t.string "name"
    t.integer "competition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "index_competition_classes_on_competition_id"
  end

  create_table "competition_entries", force: :cascade do |t|
    t.integer "driver_id", null: false
    t.integer "competition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "index_competition_entries_on_competition_id"
    t.index ["driver_id"], name: "index_competition_entries_on_driver_id"
  end

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.string "competition_type"
    t.integer "max_number_of_drivers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "open_for_registration", default: true
  end

  create_table "drivers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_drivers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_drivers_on_reset_password_token", unique: true
  end

  create_table "station_registrations", force: :cascade do |t|
    t.integer "driver_id", null: false
    t.integer "user_id", null: false
    t.integer "station_id"
    t.integer "competition_id", null: false
    t.datetime "passed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "index_station_registrations_on_competition_id"
    t.index ["driver_id"], name: "index_station_registrations_on_driver_id"
    t.index ["station_id"], name: "index_station_registrations_on_station_id"
    t.index ["user_id"], name: "index_station_registrations_on_user_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.string "station_type"
    t.integer "competition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "index_stations_on_competition_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "competition_classes", "competitions"
  add_foreign_key "competition_entries", "competitions"
  add_foreign_key "competition_entries", "drivers"
  add_foreign_key "station_registrations", "competitions"
  add_foreign_key "station_registrations", "drivers"
  add_foreign_key "station_registrations", "stations"
  add_foreign_key "station_registrations", "users"
  add_foreign_key "stations", "competitions"
end
