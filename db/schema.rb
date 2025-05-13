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

ActiveRecord::Schema[8.0].define(version: 2025_05_13_185325) do
  create_table "audits", charset: "utf8mb4", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "ingredients", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.decimal "cost", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventory_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.decimal "quantity", precision: 10, scale: 2, default: "0.0"
    t.bigint "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_inventory_items_on_ingredient_id"
    t.index ["updated_by_id"], name: "index_inventory_items_on_updated_by_id"
  end

  create_table "locations", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", charset: "utf8mb4", force: :cascade do |t|
    t.decimal "price", precision: 10, scale: 2
    t.bigint "recipe_id", null: false
    t.bigint "location_id", null: false
    t.bigint "modifier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_menu_items_on_location_id"
    t.index ["modifier_id"], name: "index_menu_items_on_modifier_id"
    t.index ["recipe_id"], name: "index_menu_items_on_recipe_id"
  end

  create_table "modifier_options", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 10, scale: 2
    t.bigint "modifier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modifier_id"], name: "index_modifier_options_on_modifier_id"
  end

  create_table "modifiers", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_ingredients", charset: "utf8mb4", force: :cascade do |t|
    t.decimal "quantity", precision: 10, scale: 2
    t.bigint "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ingredient_id"
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipes", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_members", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.date "date_of_birth"
    t.string "role"
    t.string "iban"
    t.string "bic"
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_staff_members_on_location_id"
  end

  add_foreign_key "inventory_items", "ingredients"
  add_foreign_key "inventory_items", "staff_members", column: "updated_by_id"
  add_foreign_key "menu_items", "locations"
  add_foreign_key "menu_items", "modifiers"
  add_foreign_key "menu_items", "recipes"
  add_foreign_key "modifier_options", "modifiers"
  add_foreign_key "recipe_ingredients", "recipes"
  add_foreign_key "staff_members", "locations"
end
