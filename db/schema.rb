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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111006194659) do

  create_table "accounts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subdomain"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address_one"
    t.string   "address_two"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "fax"
    t.string   "website"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "work_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.integer  "account_id"
  end

  create_table "invoices", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
    t.integer  "organization_id"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "item_id"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
    t.decimal  "cost"
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.string   "address_one"
    t.string   "address_two"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "business_phone"
    t.string   "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
    t.string   "website"
  end

  create_table "taxes", :force => true do |t|
    t.string   "name"
    t.decimal  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

end
