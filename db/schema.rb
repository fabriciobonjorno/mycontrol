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

ActiveRecord::Schema.define(version: 2023_01_22_232847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "agency"
    t.string "account"
    t.decimal "balance", precision: 10, scale: 2
    t.integer "account_type", default: 0
    t.integer "status", default: 0
    t.uuid "bank_id", null: false
    t.uuid "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account"], name: "index_accounts_on_account"
    t.index ["account_type"], name: "index_accounts_on_account_type"
    t.index ["agency"], name: "index_accounts_on_agency"
    t.index ["balance"], name: "index_accounts_on_balance"
    t.index ["bank_id"], name: "index_accounts_on_bank_id"
    t.index ["group_id"], name: "index_accounts_on_group_id"
    t.index ["status"], name: "index_accounts_on_status"
  end

  create_table "banks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "number", limit: 3
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_banks_on_name"
    t.index ["number"], name: "index_banks_on_number"
  end

  create_table "financials", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "transaction_type", default: 0
    t.decimal "total_transaction", precision: 10, scale: 2
    t.uuid "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_financials_on_account_id"
    t.index ["total_transaction"], name: "index_financials_on_total_transaction"
    t.index ["transaction_type"], name: "index_financials_on_transaction_type"
  end

  create_table "groups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_groups_on_name"
    t.index ["status"], name: "index_groups_on_status"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "installments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.decimal "payment_value", precision: 10, scale: 2
    t.date "payment_date"
    t.date "due_date"
    t.string "note"
    t.integer "status", default: 0
    t.uuid "financial_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["due_date"], name: "index_installments_on_due_date"
    t.index ["financial_id"], name: "index_installments_on_financial_id"
    t.index ["name"], name: "index_installments_on_name"
    t.index ["note"], name: "index_installments_on_note"
    t.index ["number"], name: "index_installments_on_number"
    t.index ["payment_date"], name: "index_installments_on_payment_date"
    t.index ["payment_value"], name: "index_installments_on_payment_value"
    t.index ["status"], name: "index_installments_on_status"
  end

  create_table "integration_client_reporters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "message"
    t.boolean "success"
    t.string "reportable_type", null: false
    t.uuid "reportable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message"], name: "index_integration_client_reporters_on_message"
    t.index ["reportable_id"], name: "index_integration_client_reporters_on_reportable_id"
    t.index ["reportable_type", "reportable_id"], name: "index_integration_client_reporters_on_reportable"
    t.index ["reportable_type"], name: "index_integration_client_reporters_on_reportable_type"
    t.index ["success"], name: "index_integration_client_reporters_on_success"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "banks"
  add_foreign_key "accounts", "groups"
  add_foreign_key "financials", "accounts"
  add_foreign_key "groups", "users"
  add_foreign_key "installments", "financials"
end
