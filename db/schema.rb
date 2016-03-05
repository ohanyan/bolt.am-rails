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

ActiveRecord::Schema.define(version: 20160129023757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "parent_id"
    t.string   "parent_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "locations", ["name"], name: "index_locations_on_name", unique: true, using: :btree
  add_index "locations", ["parent_type", "parent_id"], name: "index_locations_on_parent_type_and_parent_id", using: :btree

  create_table "rates", force: :cascade do |t|
    t.integer  "rated_id",   null: false
    t.string   "rated_type", null: false
    t.integer  "rater_id",   null: false
    t.string   "rater_type", null: false
    t.text     "comment"
    t.integer  "score",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rates", ["rated_type", "rated_id"], name: "index_rates_on_rated_type_and_rated_id", using: :btree
  add_index "rates", ["rater_type", "rater_id"], name: "index_rates_on_rater_type_and_rater_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "services", ["category_id"], name: "index_services_on_category_id", using: :btree
  add_index "services", ["user_id"], name: "index_services_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                           null: false
    t.string   "last_name"
    t.string   "email",                                null: false
    t.string   "authentication_token"
    t.string   "phone"
    t.string   "image"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "location_id"
    t.string   "password_digest"
    t.string   "type",                 default: "",    null: false
    t.boolean  "active",               default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "services", "categories"
  add_foreign_key "services", "users"
end
