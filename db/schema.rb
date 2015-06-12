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

ActiveRecord::Schema.define(version: 20150519041202) do

  create_table "accounts", force: :cascade do |t|
    t.string   "email",              limit: 255, default: "", null: false
    t.string   "encrypted_password", limit: 255, default: "", null: false
    t.boolean  "admin",              limit: 1
    t.string   "name",               limit: 255
    t.string   "image",              limit: 255
    t.string   "detail",             limit: 255
    t.string   "address",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree

  create_table "accounts_roles", force: :cascade do |t|
    t.integer  "role_id",    limit: 4
    t.integer  "account_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "email",        limit: 255
    t.string   "name",         limit: 255
    t.integer  "phone_number", limit: 4
    t.text     "description",  limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "detail",          limit: 65535
    t.integer  "post_sell_id",    limit: 4
    t.integer  "user_account_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "admin",           limit: 1
  end

  add_index "messages", ["post_sell_id"], name: "index_messages_on_post_sell_id", using: :btree
  add_index "messages", ["user_account_id"], name: "index_messages_on_user_account_id", using: :btree

  create_table "plant_images", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "plant_id",    limit: 4
    t.string   "image",       limit: 255
  end

  add_index "plant_images", ["plant_id"], name: "index_plant_images_on_plant_id", using: :btree

  create_table "plants", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "scientic_name", limit: 255
    t.string   "address",       limit: 255
    t.text     "description",   limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "category_id",   limit: 4
    t.string   "genus",         limit: 255
    t.string   "familia",       limit: 255
    t.integer  "technical_id",  limit: 4
  end

  add_index "plants", ["category_id"], name: "index_plants_on_category_id", using: :btree
  add_index "plants", ["technical_id"], name: "index_plants_on_technical_id", using: :btree

  create_table "post_sells", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.string   "image",           limit: 255
    t.string   "description",     limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "type",            limit: 255
    t.integer  "user_account_id", limit: 4
  end

  add_index "post_sells", ["user_account_id"], name: "index_post_sells_on_user_account_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "detail",      limit: 255
    t.string   "image",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "account_id",  limit: 4
  end

  add_index "posts", ["account_id"], name: "index_posts_on_account_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "address",      limit: 255
    t.text     "description",  limit: 65535
    t.string   "person",       limit: 255
    t.integer  "phone_number", limit: 4
    t.string   "image",        limit: 255
    t.string   "website",      limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "township",     limit: 255
  end

  create_table "technicals", force: :cascade do |t|
    t.text     "temperature",    limit: 65535
    t.text     "light",          limit: 65535
    t.text     "pH",             limit: 65535
    t.text     "fertilizer",     limit: 65535
    t.string   "trophic",        limit: 255
    t.text     "notice",         limit: 65535
    t.text     "level",          limit: 65535
    t.string   "size",           limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "growth",         limit: 65535
    t.text     "tree_structure", limit: 65535
  end

  create_table "user_accounts", force: :cascade do |t|
    t.string   "usename",      limit: 255, default: "", null: false
    t.string   "password",     limit: 255, default: "", null: false
    t.string   "name",         limit: 255
    t.string   "image",        limit: 255
    t.string   "address",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_number", limit: 255
    t.datetime "birthday"
  end

  add_index "user_accounts", ["usename"], name: "index_user_accounts_on_usename", unique: true, using: :btree

end
