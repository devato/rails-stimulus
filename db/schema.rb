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

ActiveRecord::Schema.define(version: 2018_04_09_025037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "active_organizations", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organization_id"
    t.index ["organization_id"], name: "index_active_organizations_on_organization_id"
    t.index ["user_id"], name: "index_active_organizations_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "onboards", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_onboards_on_user_id"
  end

  create_table "organization_users", id: false, force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "user_id", null: false
    t.index ["user_id", "organization_id"], name: "index_organization_users_on_user_id_and_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.boolean "default"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_organizations_on_slug"
  end

  create_table "project_users", id: false, force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.index ["user_id", "project_id"], name: "index_project_users_on_user_id_and_project_id"
  end

  create_table "projects", primary_key: ["id", "organization_id"], force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "name"
    t.string "slug"
    t.bigint "organization_id", null: false
    t.bigint "supported_language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_projects_on_organization_id"
    t.index ["slug"], name: "index_projects_on_slug"
    t.index ["supported_language_id"], name: "index_projects_on_supported_language_id"
  end

  create_table "supported_languages", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.boolean "active"
    t.index ["name"], name: "index_supported_languages_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "terms", default: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_organizations", "organizations"
  add_foreign_key "active_organizations", "users"
end
