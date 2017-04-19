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

ActiveRecord::Schema.define(version: 20170419154532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "citizens", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "name"
    t.string   "location"
    t.integer  "age"
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_citizens_on_account_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "description"
    t.integer  "user_id"
    t.integer  "regulation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "followers", force: :cascade do |t|
    t.integer  "regulation_id"
    t.integer  "citizen_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "regulations", force: :cascade do |t|
    t.string   "agency"
    t.integer  "category_id"
    t.boolean  "major_rule"
    t.string   "title"
    t.string   "summary"
    t.string   "reg_status"
    t.string   "url"
    t.integer  "document_number"
    t.string   "publication_date"
    t.integer  "federal_register_id"
    t.string   "category_name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "agency_id"
  end

  create_table "votes", force: :cascade do |t|
    t.string   "vote"
    t.integer  "user_id"
    t.integer  "regulation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "citizens", "accounts"
end
