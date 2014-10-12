# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141011194010) do

  create_table "vehiclereviews", force: true do |t|
    t.datetime "date_of_travel"
    t.string   "gps_or_location"
    t.string   "driver_name"
    t.integer  "safety_rating",   limit: 1
    t.text     "review"
    t.string   "photolink",       limit: 500
    t.integer  "vehicle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehiclereviews", ["vehicle_id"], name: "index_vehiclereviews_on_vehicle_id", using: :btree

  create_table "vehicles", force: true do |t|
    t.string   "vehicle_number", limit: 12,                                       null: false
    t.string   "transport_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "average_rating",            precision: 5, scale: 2, default: 0.0
  end

  add_index "vehicles", ["vehicle_number"], name: "index_vehicles_on_vehicle_number", unique: true, using: :btree

end
