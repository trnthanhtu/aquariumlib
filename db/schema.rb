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

ActiveRecord::Schema.define(version: 20150412142027) do

  create_table "accounts", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "role",                   limit: 255
    t.boolean  "delete_flag",            limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "delete_flag", limit: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "email",        limit: 255
    t.string   "name",         limit: 255
    t.integer  "phone_number", limit: 4
    t.text     "detail",       limit: 65535
    t.boolean  "delete_flag",  limit: 1
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "plant_images", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "name",        limit: 255
    t.boolean  "delete_flag", limit: 1
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "plant_id",    limit: 4
  end

  add_index "plant_images", ["plant_id"], name: "index_plant_images_on_plant_id", using: :btree

  create_table "plants", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "scientic_name",   limit: 255
    t.string   "vietnamese_name", limit: 255
    t.string   "address",         limit: 255
    t.text     "description",     limit: 65535
    t.integer  "level",           limit: 4
    t.string   "size",            limit: 255
    t.string   "address_grow",    limit: 255
    t.boolean  "delete_flag",     limit: 1
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "category_id",     limit: 4
  end

  add_index "plants", ["category_id"], name: "index_plants_on_category_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "detail",       limit: 255
    t.text     "discription",  limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "delete_flag",  limit: 1
    t.integer  "plant_id",     limit: 4
    t.integer  "type_post_id", limit: 4
  end

  add_index "posts", ["plant_id"], name: "index_posts_on_plant_id", using: :btree
  add_index "posts", ["type_post_id"], name: "index_posts_on_type_post_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "point",       limit: 4
    t.boolean  "delete_flag", limit: 1
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "post_id",     limit: 4
  end

  add_index "ratings", ["post_id"], name: "index_ratings_on_post_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "address",      limit: 255
    t.text     "description",  limit: 65535
    t.string   "person",       limit: 255
    t.integer  "phone_number", limit: 4
    t.string   "image",        limit: 255
    t.string   "home_url",     limit: 255
    t.boolean  "delete_flag",  limit: 1
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "technicals", force: :cascade do |t|
    t.integer  "temperature", limit: 4
    t.integer  "light",       limit: 4
    t.integer  "pH",          limit: 4
    t.text     "fertilizer",  limit: 65535
    t.string   "trophic",     limit: 255
    t.text     "notice",      limit: 65535
    t.boolean  "delete_flag", limit: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "plant_id",    limit: 4
  end

  add_index "technicals", ["plant_id"], name: "index_technicals_on_plant_id", using: :btree

  create_table "type_posts", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "delete_flag", limit: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
