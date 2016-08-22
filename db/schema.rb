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

ActiveRecord::Schema.define(version: 20160822013312) do

  create_table "participants", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "shirt"
    t.integer  "level"
    t.integer  "volunteer"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "registration_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.integer  "donation"
    t.integer  "xs_shirts"
    t.integer  "s_shirts"
    t.integer  "m_shirts"
    t.integer  "l_shirts"
    t.integer  "xl_shirts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end