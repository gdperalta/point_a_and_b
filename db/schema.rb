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

ActiveRecord::Schema.define(version: 2022_06_10_073254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "zip_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "address_type"
    t.bigint "city_id", null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.bigint "province_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["province_id"], name: "index_cities_on_province_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "iso3"
    t.string "iso2"
    t.string "phone_code"
    t.string "currency"
    t.string "currency_symbol"
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "courier_rates", force: :cascade do |t|
    t.string "name"
    t.integer "within_metro_manila"
    t.integer "outside_metro_manila"
    t.integer "delivery_option"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["country_id"], name: "index_provinces_on_country_id"
  end

  create_table "shipment_quotes", force: :cascade do |t|
    t.bigint "pickup_address_id", null: false
    t.bigint "delivery_address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["delivery_address_id"], name: "index_shipment_quotes_on_delivery_address_id"
    t.index ["pickup_address_id"], name: "index_shipment_quotes_on_pickup_address_id"
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "cities", "provinces"
  add_foreign_key "provinces", "countries"
  add_foreign_key "shipment_quotes", "addresses", column: "delivery_address_id"
  add_foreign_key "shipment_quotes", "addresses", column: "pickup_address_id"
end
