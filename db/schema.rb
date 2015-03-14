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

ActiveRecord::Schema.define(version: 20150314222752) do

  create_table "badges", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.string   "age_level"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "skill"
  end

  create_table "badges_ideas", force: true do |t|
    t.integer  "badge_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "badges_ideas", ["badge_id"], name: "index_badges_ideas_on_badge_id"
  add_index "badges_ideas", ["idea_id"], name: "index_badges_ideas_on_idea_id"

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "troop_id"
  end

  create_table "ideas", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.string   "age_level"
    t.integer  "badge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "leadership_request"
    t.string   "role",                   default: "member"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true

  create_table "parsers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "troop_badges", force: true do |t|
    t.integer  "troop_id"
    t.integer  "badge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "troops", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "age_level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "leader_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

end
