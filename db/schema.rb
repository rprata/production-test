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

ActiveRecord::Schema.define(version: 20160611013313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "br_tests", force: true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "age"
    t.string   "hometown"
    t.string   "occupation"
    t.string   "education"
    t.string   "email"
    t.string   "bilingual"
    t.string   "foreign"
    t.string   "answer_1"
    t.string   "answer_2"
    t.string   "answer_3"
    t.string   "answer_4"
    t.string   "answer_5"
    t.string   "answer_6"
    t.string   "answer_7"
    t.string   "answer_8"
    t.string   "answer_9"
    t.string   "answer_10"
    t.string   "answer_11"
    t.string   "answer_12"
    t.string   "answer_13"
    t.string   "answer_14"
    t.string   "answer_15"
    t.string   "answer_16"
    t.string   "answer_17"
    t.string   "answer_18"
    t.integer  "wrong_answers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tests", force: true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "age"
    t.string   "hometown"
    t.string   "occupation"
    t.string   "education"
    t.string   "email"
    t.string   "bilingual"
    t.string   "foreign"
    t.string   "answer_1"
    t.string   "answer_2"
    t.string   "answer_3"
    t.string   "answer_4"
    t.string   "answer_5"
    t.string   "answer_6"
    t.string   "answer_7"
    t.string   "answer_8"
    t.string   "answer_9"
    t.string   "answer_10"
    t.string   "answer_11"
    t.string   "answer_12"
    t.string   "answer_13"
    t.string   "answer_14"
    t.string   "answer_15"
    t.string   "answer_16"
    t.string   "answer_17"
    t.string   "answer_18"
    t.integer  "wrong_answers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
