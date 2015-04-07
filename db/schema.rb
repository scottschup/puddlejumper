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

ActiveRecord::Schema.define(version: 20150407185417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gate_trips", force: :cascade do |t|
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.integer  "remaining_space"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "gate_trips", ["destination_id"], name: "index_gate_trips_on_destination_id", using: :btree
  add_index "gate_trips", ["origin_id", "destination_id"], name: "index_gate_trips_on_origin_id_and_destination_id", using: :btree
  add_index "gate_trips", ["origin_id"], name: "index_gate_trips_on_origin_id", using: :btree

  create_table "gates", force: :cascade do |t|
    t.string   "address",    null: false
    t.integer  "planet_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "gates", ["address"], name: "index_gates_on_address", using: :btree
  add_index "gates", ["planet_id"], name: "index_gates_on_planet_id", using: :btree

  create_table "planets", force: :cascade do |t|
    t.string   "name",                       null: false
    t.string   "desc"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "galaxy",                     null: false
    t.string   "race"
    t.boolean  "protected",  default: false
    t.integer  "clearance",                  null: false
  end

  add_index "planets", ["clearance"], name: "index_planets_on_clearance", using: :btree
  add_index "planets", ["name"], name: "index_planets_on_name", using: :btree

end