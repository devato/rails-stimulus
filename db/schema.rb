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

ActiveRecord::Schema.define(version: 20180405171848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id"
    t.bigint "supported_language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_applications_on_organization_id"
    t.index ["supported_language_id"], name: "index_applications_on_supported_language_id"
  end

  create_table "onboards", force: :cascade do |t|
    t.bigint "user_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_onboards_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.string "industry"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supported_languages", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.string "image"
  end

  create_table "user_applications", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "application_id"
    t.index ["application_id"], name: "index_user_applications_on_application_id"
    t.index ["user_id"], name: "index_user_applications_on_user_id"
  end

  create_table "user_organizations", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organization_id"
    t.index ["organization_id"], name: "index_user_organizations_on_organization_id"
    t.index ["user_id"], name: "index_user_organizations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "terms"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "applications", "organizations"
  add_foreign_key "applications", "supported_languages"
  add_foreign_key "onboards", "users"
  add_foreign_key "user_applications", "applications"
  add_foreign_key "user_applications", "users"
  add_foreign_key "user_organizations", "organizations"
  add_foreign_key "user_organizations", "users"
end
