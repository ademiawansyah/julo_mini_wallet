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

ActiveRecord::Schema.define(version: 2023_07_05_022221) do

  create_table "account_histories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "account_id"
    t.string "action", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_histories_on_account_id"
    t.index ["deleted_at"], name: "index_account_histories_on_deleted_at"
  end

  create_table "account_tokens", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "account_id"
    t.string "token", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_tokens_on_account_id"
    t.index ["deleted_at"], name: "index_account_tokens_on_deleted_at"
    t.index ["token"], name: "index_account_tokens_on_token"
  end

  create_table "accounts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "customer_xid", null: false
    t.string "wallet_id"
    t.boolean "status", default: false
    t.integer "balance", default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_xid"], name: "index_accounts_on_customer_xid"
    t.index ["deleted_at"], name: "index_accounts_on_deleted_at"
    t.index ["wallet_id"], name: "index_accounts_on_wallet_id"
  end

  create_table "transactions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "account_id"
    t.string "type", null: false
    t.string "transaction_id", null: false
    t.string "reference_id", null: false
    t.boolean "status", default: false
    t.integer "amount", default: 0
    t.integer "balance"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["deleted_at"], name: "index_transactions_on_deleted_at"
    t.index ["reference_id"], name: "index_transactions_on_reference_id"
    t.index ["transaction_id"], name: "index_transactions_on_transaction_id"
    t.index ["type"], name: "index_transactions_on_type"
  end

end
