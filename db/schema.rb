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

ActiveRecord::Schema.define(version: 20150327020557) do

  create_table "orders", force: :cascade do |t|
    t.string   "uname",      limit: 30
    t.string   "uaddress",   limit: 30
    t.string   "upost",      limit: 30
    t.string   "uphone",     limit: 30
    t.string   "uhomephone", limit: 30
    t.float    "pirce",      limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "uname",      limit: 30
    t.string   "upwd",       limit: 30
    t.string   "umail",      limit: 30
    t.string   "uphone",     limit: 30
    t.string   "uaddress",   limit: 30
    t.string   "uimpower",   limit: 30
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "wares", force: :cascade do |t|
    t.string   "wname",      limit: 30
    t.text     "wdesc",      limit: 65535
    t.string   "wtype",      limit: 30
    t.string   "wfactory",   limit: 30
    t.float    "wprice",     limit: 24
    t.string   "wimg",       limit: 30
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
