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

ActiveRecord::Schema.define(version: 20170924124655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "state_full"
    t.string "county"
    t.string "city_alias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "congress_members", force: :cascade do |t|
    t.integer "congress", default: 115, null: false
    t.string "congress_type", default: "senate"
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.string "pp_member_id", null: false
    t.string "twitter_handle"
    t.text "twitter_picture_url"
    t.string "party", null: false
    t.string "state", null: false
    t.jsonb "general_response_api", default: {}
    t.jsonb "member_profile_response_api", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.index ["full_name"], name: "index_congress_members_on_full_name"
  end

  create_table "states", force: :cascade do |t|
    t.string "state", limit: 2
    t.string "state_full"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state"], name: "index_states_on_state", unique: true
    t.index ["state_full"], name: "index_states_on_state_full"
  end

  create_table "zipcodes", force: :cascade do |t|
    t.string "zipcode", limit: 5
    t.string "zipcode_type"
    t.string "city"
    t.string "state", limit: 2
    t.string "location_type"
    t.float "latitude"
    t.float "longitude"
    t.string "world_region"
    t.string "country", limit: 2
    t.string "location_text"
    t.boolean "decomissioned", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_zipcodes_on_city"
    t.index ["country"], name: "index_zipcodes_on_country"
    t.index ["location_text"], name: "index_zipcodes_on_location_text"
    t.index ["zipcode"], name: "index_zipcodes_on_zipcode"
  end

  add_foreign_key "cities", "states", column: "state", primary_key: "state"
  add_foreign_key "zipcodes", "states", column: "state", primary_key: "state"
end
