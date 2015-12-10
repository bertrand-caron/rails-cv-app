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

ActiveRecord::Schema.define(version: 20150418061932) do

  create_table "awards", force: :cascade do |t|
    t.string   "title"
    t.string   "location"
    t.text     "description"
    t.string   "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank"
  end

  create_table "blog_articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educations", force: :cascade do |t|
    t.string   "institution"
    t.string   "institution_location"
    t.string   "degree"
    t.string   "year"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank"
  end

  create_table "followers", force: :cascade do |t|
    t.string   "email"
    t.datetime "reminder"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "internships", force: :cascade do |t|
    t.text     "title"
    t.string   "hyperlink"
    t.text     "description"
    t.string   "report_path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "laboratory"
    t.string   "location"
    t.string   "duration"
    t.integer  "rank"
    t.integer  "referee_id"
  end

  create_table "programming_skills", force: :cascade do |t|
    t.string   "title"
    t.integer  "skill_type"
    t.text     "description"
    t.text     "details"
    t.string   "hyperlink"
    t.integer  "rank"
    t.integer  "ranking"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon"
  end

  create_table "publications", force: :cascade do |t|
    t.string   "title"
    t.string   "journal"
    t.text     "authors"
    t.text     "details"
    t.text     "abstract"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank"
  end

  create_table "referees", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "personal_page"
    t.integer  "gender"
    t.integer  "rank"
    t.string   "thumbnail_img"
    t.integer  "uploaded_file_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true

  create_table "skills", force: :cascade do |t|
    t.string   "title"
    t.string   "skill_type"
    t.text     "description"
    t.text     "details"
    t.string   "hyperlink"
    t.integer  "rank"
    t.integer  "level"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "softwares", force: :cascade do |t|
    t.string   "name"
    t.string   "github_link"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hyperlink"
  end

  create_table "uploaded_files", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "extract"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "work_experiences", force: :cascade do |t|
    t.text     "title"
    t.string   "hyperlink"
    t.text     "description"
    t.string   "report_path"
    t.string   "location"
    t.string   "duration"
    t.integer  "rank"
    t.integer  "referee_id"
    t.string   "company"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
