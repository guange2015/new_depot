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

ActiveRecord::Schema.define(version: 20131106100014) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code",       limit: 255
    t.integer  "level",      limit: 4
    t.integer  "order",      limit: 4
  end

  create_table "data_forms", force: :cascade do |t|
    t.string   "comment",    limit: 255
    t.integer  "s_type",     limit: 4
    t.integer  "state",      limit: 4,   default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_lists", force: :cascade do |t|
    t.integer  "data_form_id", limit: 4
    t.integer  "firework_id",  limit: 4
    t.integer  "data_number",  limit: 4
    t.integer  "last_data",    limit: 4
    t.integer  "s_type",       limit: 4
    t.integer  "state",        limit: 4, default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "before_data",  limit: 4
  end

  create_table "fireworks", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "spec",        limit: 255
    t.integer  "lastdata",    limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comment",     limit: 60
    t.integer  "category_id", limit: 4
    t.float    "price",       limit: 24
    t.integer  "rate",        limit: 4
  end

  add_index "fireworks", ["category_id"], name: "index_fireworks_on_category_id", using: :btree

end
