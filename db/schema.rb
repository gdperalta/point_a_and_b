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

ActiveRecord::Schema.define(version: 2022_06_07_154354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "province"
    t.string "country"
    t.string "zip_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shipment_quotes", force: :cascade do |t|
    t.bigint "pickup_address_id", null: false
    t.bigint "delivery_address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["delivery_address_id"], name: "index_shipment_quotes_on_delivery_address_id"
    t.index ["pickup_address_id"], name: "index_shipment_quotes_on_pickup_address_id"
  end

  add_foreign_key "shipment_quotes", "addresses", column: "delivery_address_id"
  add_foreign_key "shipment_quotes", "addresses", column: "pickup_address_id"
end
