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

ActiveRecord::Schema[7.0].define(version: 2022_10_15_135139) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.string "budget_title"
    t.string "budget_status"
    t.float "budget_amount"
    t.date "budget_start_date"
    t.date "budget_end_date"
    t.string "budget_type"
    t.bigint "coproperty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coproperty_id"], name: "index_budgets_on_coproperty_id"
  end

  create_table "coproperties", force: :cascade do |t|
    t.string "coproperty_name"
    t.integer "number_properties"
    t.string "address"
    t.string "expense_method"
    t.integer "coprop_private_area"
    t.integer "coprop_common_area"
    t.integer "bank_account"
    t.bigint "syndic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "building_type"
    t.index ["syndic_id"], name: "index_coproperties_on_syndic_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "expense_name"
    t.string "expense_type"
    t.float "expense_amount"
    t.date "expense_date"
    t.bigint "budget_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "expense_status"
    t.index ["budget_id"], name: "index_expenses_on_budget_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "coproperty_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coproperty_id"], name: "index_messages_on_coproperty_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.integer "card_number"
    t.string "phone_number"
    t.date "ownership_date"
    t.date "birth_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_owners_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "payment_status"
    t.float "payment_amount"
    t.date "payment_date"
    t.string "payment_title"
    t.bigint "property_id", null: false
    t.bigint "budget_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_payments_on_budget_id"
    t.index ["property_id"], name: "index_payments_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "building"
    t.integer "property_number"
    t.integer "total_property_area"
    t.string "payment_frequency"
    t.bigint "owner_id", null: false
    t.bigint "coproperty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "floor"
    t.index ["coproperty_id"], name: "index_properties_on_coproperty_id"
    t.index ["owner_id"], name: "index_properties_on_owner_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "request_title"
    t.date "request_date"
    t.string "request_status"
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_requests_on_property_id"
  end

  create_table "syndics", force: :cascade do |t|
    t.string "syndic_name"
    t.date "creation_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_syndics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "role", default: "Owner", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "budgets", "coproperties"
  add_foreign_key "coproperties", "syndics"
  add_foreign_key "expenses", "budgets"
  add_foreign_key "messages", "coproperties"
  add_foreign_key "messages", "users"
  add_foreign_key "owners", "users"
  add_foreign_key "payments", "budgets"
  add_foreign_key "payments", "properties"
  add_foreign_key "properties", "coproperties"
  add_foreign_key "properties", "owners"
  add_foreign_key "requests", "properties"
  add_foreign_key "syndics", "users"
end
