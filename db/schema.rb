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

ActiveRecord::Schema.define(version: 20171008151802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_accounts_on_email", using: :btree
  end

  create_table "actionFollows", force: :cascade do |t|
    t.integer  "action_id"
    t.integer  "citizen_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "action_bodies", force: :cascade do |t|
    t.integer  "action_id"
    t.text     "html_blob"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actions", force: :cascade do |t|
    t.string   "title"
    t.string   "summary"
    t.string   "type"
    t.string   "agency_acronym"
    t.string   "agency_full"
    t.integer  "agency_id"
    t.string   "subagency"
    t.integer  "category_id"
    t.string   "category_name"
    t.string   "status"
    t.boolean  "significant"
    t.string   "priority_category"
    t.string   "action"
    t.string   "action_body"
    t.date     "publication_date"
    t.string   "document_number"
    t.string   "fedregister_id"
    t.string   "reg_id"
    t.string   "docket_id"
    t.boolean  "open_for_comment"
    t.integer  "comments_received"
    t.date     "comment_end_date"
    t.date     "comment_start_date"
    t.integer  "attachment_number"
    t.string   "contact"
    t.string   "tags"
    t.string   "corrections"
    t.string   "date_desc"
    t.integer  "days_left"
    t.string   "html_url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "cat_follows", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "citizen_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.integer  "citizen_id"
    t.integer  "action_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dockets", force: :cascade do |t|
    t.string "name"
    t.string "type"
  end

  create_table "votes", force: :cascade do |t|
    t.string   "vote"
    t.integer  "citizen_id"
    t.integer  "action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "citizens", "accounts"
end
