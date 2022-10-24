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

ActiveRecord::Schema[7.0].define(version: 2022_10_20_185326) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "blazer_audits", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type"
    t.text "message"
    t.datetime "last_run_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
  end

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

  create_table "expense_votes", force: :cascade do |t|
    t.boolean "vote_up"
    t.bigint "owner_id", null: false
    t.bigint "expense_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_expense_votes_on_expense_id"
    t.index ["owner_id"], name: "index_expense_votes_on_owner_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "expense_name"
    t.string "expense_type"
    t.float "expense_amount"
    t.date "expense_date"
    t.bigint "budget_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "expense_status", default: "Proposé"
    t.index ["budget_id"], name: "index_expenses_on_budget_id"
  end

  create_table "links", force: :cascade do |t|
    t.text "encrypted_key"
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_links_on_property_id"
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
    t.bigint "owner_id"
    t.bigint "coproperty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "floor"
    t.index ["coproperty_id"], name: "index_properties_on_coproperty_id"
    t.index ["owner_id"], name: "index_properties_on_owner_id"
  end

  create_table "requests", force: :cascade do |t|
    t.text "request_title"
    t.date "request_date"
    t.string "request_status"
    t.bigint "property_id", null: false
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "object"
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
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "budgets", "coproperties"
  add_foreign_key "coproperties", "syndics"
  add_foreign_key "expense_votes", "expenses"
  add_foreign_key "expense_votes", "owners"
  add_foreign_key "expenses", "budgets"
  add_foreign_key "links", "properties"
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
