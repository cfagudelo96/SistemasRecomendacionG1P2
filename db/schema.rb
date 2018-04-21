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

ActiveRecord::Schema.define(version: 2018_04_20_042551) do

  create_table "attribute", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "business_id", limit: 22, null: false
    t.string "name"
    t.text "value", limit: 16777215
  end

  create_table "businesses", id: :string, limit: 22, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "neighborhood"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.float "latitude"
    t.float "longitude"
    t.float "stars"
    t.integer "review_count"
    t.boolean "is_open"
  end

  create_table "categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "business_id", limit: 22, null: false
    t.string "category"
  end

  create_table "checkin", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "business_id", limit: 22, null: false
    t.string "date"
    t.integer "count"
  end

  create_table "elite_years", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", limit: 22, null: false
    t.string "year", limit: 4, null: false
  end

  create_table "friend", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", limit: 22, null: false
    t.string "friend_id", limit: 22, null: false
  end

  create_table "hours", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "business_id", limit: 22, null: false
    t.string "hours"
  end

  create_table "photo", id: :string, limit: 22, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "business_id", limit: 22, null: false
    t.string "caption"
    t.string "label"
  end

  create_table "recommendations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id"
    t.string "business_id"
    t.float "recommendation"
    t.integer "recommendation_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", id: :string, limit: 22, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "business_id", limit: 22, null: false
    t.string "user_id", limit: 22, null: false
    t.integer "stars"
    t.datetime "date"
    t.text "text", limit: 16777215
    t.integer "useful"
    t.integer "funny"
    t.integer "cool"
  end

  create_table "tip", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id", limit: 22, null: false
    t.string "business_id", limit: 22, null: false
    t.text "text", limit: 16777215
    t.datetime "date"
    t.integer "likes"
  end

  create_table "users", id: :string, limit: 22, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "review_count"
    t.datetime "yelping_since"
    t.integer "useful"
    t.integer "funny"
    t.integer "cool"
    t.integer "fans"
    t.float "average_stars"
    t.integer "compliment_hot"
    t.integer "compliment_more"
    t.integer "compliment_profile"
    t.integer "compliment_cute"
    t.integer "compliment_list"
    t.integer "compliment_note"
    t.integer "compliment_plain"
    t.integer "compliment_cool"
    t.integer "compliment_funny"
    t.integer "compliment_writer"
    t.integer "compliment_photos"
  end

end
