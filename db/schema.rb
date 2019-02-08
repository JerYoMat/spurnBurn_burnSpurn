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

ActiveRecord::Schema.define(version: 20190208014425) do

  create_table "health_warnings", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.integer "product_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_health_warnings_on_product_id"
    t.index ["user_id"], name: "index_health_warnings_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "num_active_users"
    t.string "logo_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.float "score"
    t.integer "user_id"
    t.integer "health_warning_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["health_warning_id"], name: "index_ratings_on_health_warning_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "smoking_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
