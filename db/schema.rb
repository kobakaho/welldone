# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_04_22_072802) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "category_cloths", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "cloth_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_cloths_on_category_id"
    t.index ["cloth_id"], name: "index_category_cloths_on_cloth_id"
  end

  create_table "category_seasons", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_seasons_on_category_id"
    t.index ["season_id"], name: "index_category_seasons_on_season_id"
  end

  create_table "checklist_items", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checklists", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_checklists_on_title", unique: true
    t.index ["user_id"], name: "index_checklists_on_user_id"
  end

  create_table "cloths", force: :cascade do |t|
    t.string "image_file", null: false
    t.string "brand"
    t.text "body"
    t.date "purchase_date"
    t.integer "price"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_cloths_on_discarded_at"
    t.index ["user_id"], name: "index_cloths_on_user_id"
  end

  create_table "default_item_checklists", force: :cascade do |t|
    t.bigint "default_item_id", null: false
    t.bigint "checklist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_id"], name: "index_default_item_checklists_on_checklist_id"
    t.index ["default_item_id"], name: "index_default_item_checklists_on_default_item_id"
  end

  create_table "default_items", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "cloth_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cloth_id"], name: "index_favorites_on_cloth_id"
    t.index ["user_id", "cloth_id"], name: "index_favorites_on_user_id_and_cloth_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "original_item_checklists", force: :cascade do |t|
    t.bigint "original_item_id", null: false
    t.bigint "checklist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_id"], name: "index_original_item_checklists_on_checklist_id"
    t.index ["original_item_id"], name: "index_original_item_checklists_on_original_item_id"
  end

  create_table "original_items", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "season_cloths", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.bigint "cloth_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cloth_id"], name: "index_season_cloths_on_cloth_id"
    t.index ["season_id"], name: "index_season_cloths_on_season_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "profile_image"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider"
  end

  add_foreign_key "category_cloths", "categories"
  add_foreign_key "category_cloths", "cloths"
  add_foreign_key "category_seasons", "categories"
  add_foreign_key "category_seasons", "seasons"
  add_foreign_key "checklists", "users"
  add_foreign_key "cloths", "users"
  add_foreign_key "default_item_checklists", "checklists"
  add_foreign_key "default_item_checklists", "default_items"
  add_foreign_key "favorites", "cloths"
  add_foreign_key "favorites", "users"
  add_foreign_key "original_item_checklists", "checklists"
  add_foreign_key "original_item_checklists", "original_items"
  add_foreign_key "season_cloths", "cloths"
  add_foreign_key "season_cloths", "seasons"
end
