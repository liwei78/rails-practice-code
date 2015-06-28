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

ActiveRecord::Schema.define(version: 20150628073804) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "state"
    t.string   "city"
    t.string   "address"
    t.string   "address2"
    t.string   "zipcode"
    t.string   "receiver"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id"

  create_table "cart_items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "variant_id"
    t.integer  "quantity",   default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "catalogs", force: :cascade do |t|
    t.integer  "parent_catalog_id"
    t.string   "name"
    t.boolean  "parent"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "catalogs", ["parent_catalog_id"], name: "index_catalogs_on_parent_catalog_id"

  create_table "line_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "variant_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id"
  add_index "line_items", ["variant_id"], name: "index_line_items_on_variant_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "number"
    t.string   "payment_state"
    t.string   "shipment_state"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "top"
    t.boolean  "hot"
  end

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "orders_count"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_variants", id: false, force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "variant_id", null: false
  end

  add_index "users_variants", ["variant_id", "user_id"], name: "index_users_variants_on_variant_id_and_user_id", unique: true

  create_table "variants", force: :cascade do |t|
    t.integer  "product_id"
    t.decimal  "price"
    t.string   "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "color"
  end

  add_index "variants", ["product_id"], name: "index_variants_on_product_id"

end
