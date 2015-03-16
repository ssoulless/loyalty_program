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

ActiveRecord::Schema.define(version: 20150314183459) do

  create_table "clients", force: :cascade do |t|
    t.string   "full_name"
    t.string   "cedula"
    t.string   "phone"
    t.date     "birthday"
    t.integer  "age"
    t.string   "address"
    t.integer  "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "gender"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "store_id"
    t.integer  "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["client_id"], name: "index_memberships_on_client_id"
  add_index "memberships", ["store_id"], name: "index_memberships_on_store_id"

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.string   "type_of_store"
    t.string   "address"
    t.string   "phone"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "pointsfirst"
    t.integer  "pointssecond"
    t.integer  "pointsthird"
    t.string   "rewardfirst"
    t.string   "rewardsecond"
    t.string   "rewardthird"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "store_id"
    t.text     "description"
    t.integer  "total_cents"
    t.integer  "points_awarded"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "transactions", ["client_id"], name: "index_transactions_on_client_id"
  add_index "transactions", ["store_id"], name: "index_transactions_on_store_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
