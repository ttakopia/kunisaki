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

ActiveRecord::Schema.define(version: 20151028073309) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",               limit: 255, default: "", null: false
    t.string   "encrypted_password",  limit: 255, default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",  limit: 255
    t.string   "last_sign_in_ip",     limit: 255
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree

  create_table "arts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "body",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "assets", force: :cascade do |t|
    t.integer  "picture_id",         limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "assets", ["picture_id"], name: "index_assets_on_picture_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "picture_id", limit: 4
    t.string   "commenter",  limit: 255
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "user_id",    limit: 255
    t.integer  "event_id",   limit: 4
  end

  add_index "comments", ["event_id"], name: "index_comments_on_event_id", using: :btree
  add_index "comments", ["picture_id"], name: "index_comments_on_picture_id", using: :btree

  create_table "destroys", force: :cascade do |t|
    t.string   "garary",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "title",         limit: 255
    t.date     "opendate"
    t.string   "opendate_memo", limit: 255
    t.string   "postal",        limit: 255
    t.string   "address",       limit: 255
    t.string   "address_embed", limit: 255
    t.integer  "fee",           limit: 4
    t.string   "limit",         limit: 255
    t.string   "desc_short",    limit: 255
    t.text     "desc_long",     limit: 65535
    t.binary   "picture_main",  limit: 16777215
    t.binary   "picture_1",     limit: 16777215
    t.binary   "picture_2",     limit: 16777215
    t.binary   "picture_3",     limit: 16777215
    t.string   "url",           limit: 255
    t.string   "url_facebook",  limit: 255
    t.string   "url_twitter",   limit: 255
    t.boolean  "visible"
    t.string   "address_title", limit: 255
    t.string   "fee_memo",      limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "content",       limit: 255
    t.string   "title",         limit: 255
    t.string   "description",   limit: 255
    t.string   "address",       limit: 255
    t.float    "latitude",      limit: 24
    t.float    "longitude",     limit: 24
    t.boolean  "gmaps"
    t.string   "access",        limit: 255
    t.string   "worktime",      limit: 255
    t.string   "rest",          limit: 255
    t.string   "fee",           limit: 255
    t.string   "credit",        limit: 255
    t.string   "parking",       limit: 255
    t.string   "parkingnumber", limit: 255
    t.string   "parkingfee",    limit: 255
    t.string   "phonenumber",   limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "event_id",   limit: 4
    t.string   "short_desc", limit: 255
    t.text     "long_desc",  limit: 65535
    t.binary   "picture_1",  limit: 16777215
    t.binary   "picture_2",  limit: 16777215
    t.binary   "picture_3",  limit: 16777215
    t.boolean  "visible"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "picture_id",             limit: 4
    t.string   "commenter",              limit: 255
    t.text     "body",                   limit: 65535
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "uid",                    limit: 255
    t.string   "provider",               limit: 255
    t.string   "name",                   limit: 255,   default: "", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["picture_id"], name: "index_users_on_picture_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "assets", "pictures"
  add_foreign_key "comments", "events"
  add_foreign_key "comments", "pictures"
end
