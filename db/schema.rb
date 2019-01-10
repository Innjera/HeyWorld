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

ActiveRecord::Schema.define(version: 2018_12_20_175058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bid_prices", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "engine_id", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["engine_id"], name: "index_bid_prices_on_engine_id"
    t.index ["user_id"], name: "index_bid_prices_on_user_id"
  end

  create_table "engines", force: :cascade do |t|
    t.bigint "seller_id", null: false
    t.bigint "tender_id", null: false
    t.string "car_make", null: false
    t.string "car_model", null: false
    t.string "car_model_code"
    t.date "registration_year"
    t.integer "condition", default: 0, null: false
    t.string "engine_model_code"
    t.string "mileage"
    t.integer "drive", default: 0, null: false
    t.integer "mission_type", default: 0, null: false
    t.integer "intake_manifold", default: 0, null: false
    t.integer "throttle_body", default: 0, null: false
    t.integer "exhaust_manifold", default: 0, null: false
    t.integer "ignition_coil", default: 0
    t.integer "turbo_charger", default: 0
    t.integer "fly_wheel", default: 0, null: false
    t.integer "compressor", default: 0, null: false
    t.integer "power_steering_pump", default: 0, null: false
    t.integer "starter", default: 0, null: false
    t.integer "alternator", default: 0, null: false
    t.integer "ecu", default: 0, null: false
    t.integer "engine_harness", default: 0, null: false
    t.integer "front_suspension", default: 0, null: false
    t.integer "rear_suspension", default: 0, null: false
    t.text "remarks"
    t.integer "minimum_price", default: 10000, null: false
    t.boolean "sold", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_engines_on_seller_id"
    t.index ["tender_id"], name: "index_engines_on_tender_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "company_name"
    t.string "company_name_en"
    t.string "company_address"
    t.string "company_url"
    t.string "company_tell"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_sellers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_sellers_on_unlock_token", unique: true
  end

  create_table "tender_locations", force: :cascade do |t|
    t.bigint "seller_id", null: false
    t.string "address", null: false
    t.string "address_country_part", default: "Japan", null: false
    t.string "address_prefecture_part", null: false
    t.string "address_city_part", null: false
    t.string "address_rest_part", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_tender_locations_on_seller_id"
  end

  create_table "tender_rules", force: :cascade do |t|
    t.bigint "seller_id", null: false
    t.boolean "payment_cash_in_advance", null: false
    t.boolean "payment_bank_transfer_in_advance", null: false
    t.boolean "payment_credit_card_in_advance", null: false
    t.integer "tax", default: 0, null: false
    t.integer "delivery", default: 0, null: false
    t.integer "pickup_date", null: false
    t.integer "cancel", default: 0, null: false
    t.integer "priority", default: 0, null: false
    t.integer "disclose", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_tender_rules_on_seller_id"
  end

  create_table "tenders", force: :cascade do |t|
    t.bigint "seller_id", null: false
    t.bigint "tender_location_id", null: false
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.string "status", default: "draft", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_tenders_on_seller_id"
    t.index ["tender_location_id"], name: "index_tenders_on_tender_location_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "provider"
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.string "image"
    t.string "nationality"
    t.string "tel"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
