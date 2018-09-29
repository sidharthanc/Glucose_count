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

ActiveRecord::Schema.define(version: 20180925115707) do

  create_table "address_types", force: :cascade do |t|
    t.string   "description", limit: 6, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.integer  "address_type_id",  limit: 4
    t.string   "address_line1",    limit: 128
    t.string   "address_line2",    limit: 128
    t.string   "state",            limit: 50
    t.string   "zip",              limit: 10
    t.string   "iso_country_code", limit: 3,   null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "addresses", ["address_type_id"], name: "index_addresses_on_address_type_id", using: :btree

  create_table "admin_roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_readings", force: :cascade do |t|
    t.integer  "reading",    limit: 4
    t.integer  "person_id",  limit: 4
    t.datetime "date_done",            null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "daily_readings", ["date_done"], name: "index_daily_readings_on_date_done", using: :btree
  add_index "daily_readings", ["person_id"], name: "fk_rails_a24734cf06", using: :btree

  create_table "doctor_roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.datetime "dob"
    t.string   "email",           limit: 255, default: "", null: false
    t.integer  "person_id",       limit: 4
    t.integer  "guardian_id",     limit: 4
    t.integer  "doctor_id",       limit: 4,                null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "sex",             limit: 1,   default: ""
    t.integer  "phone_number_id", limit: 4
    t.integer  "address_id",      limit: 4
  end

  add_index "patients", ["address_id"], name: "fk_rails_39783febcc", using: :btree
  add_index "patients", ["doctor_id"], name: "fk_rails_9739853ad1", using: :btree
  add_index "patients", ["email"], name: "index_patients_on_email", using: :btree
  add_index "patients", ["guardian_id"], name: "fk_rails_da4b0c4922", using: :btree
  add_index "patients", ["person_id"], name: "fk_rails_f10cf91b9e", using: :btree
  add_index "patients", ["phone_number_id"], name: "fk_rails_92b719f801", using: :btree

  create_table "persons", force: :cascade do |t|
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "first_name",      limit: 255, default: ""
    t.string   "last_name",       limit: 255, default: ""
    t.datetime "dob"
    t.string   "sex",             limit: 1,   default: ""
    t.string   "email",           limit: 255, default: "", null: false
    t.integer  "phone_number_id", limit: 4
    t.integer  "address_id",      limit: 4
  end

  add_index "persons", ["address_id"], name: "fk_rails_d53a134b2c", using: :btree
  add_index "persons", ["phone_number_id"], name: "fk_rails_008e92a293", using: :btree

  create_table "persons_roles", id: false, force: :cascade do |t|
    t.integer "person_id", limit: 4
    t.integer "role_id",   limit: 4
  end

  add_index "persons_roles", ["person_id"], name: "index_persons_roles_on_person_id", using: :btree
  add_index "persons_roles", ["role_id"], name: "index_persons_roles_on_role_id", using: :btree

  create_table "phone_number_types", force: :cascade do |t|
    t.string   "description", limit: 6, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.integer  "phone_number_type_id", limit: 4
    t.string   "phone_number",         limit: 16, null: false
    t.string   "extension",            limit: 6
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "phone_numbers", ["phone_number_type_id"], name: "index_phone_numbers_on_phone_number_type_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "roles", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "subrole_id",   limit: 4
    t.string   "subrole_type", limit: 255
    t.string   "route_path",   limit: 255
  end

  add_index "roles", ["subrole_type", "subrole_id"], name: "index_roles_on_subrole_type_and_subrole_id", using: :btree

  create_table "salutations", force: :cascade do |t|
    t.string   "salutation", limit: 6, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.string   "name",                   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token",   limit: 255
    t.integer  "person_id",              limit: 4
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["person_id"], name: "index_users_on_person_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "addresses", "address_types"
  add_foreign_key "daily_readings", "persons"
  add_foreign_key "patients", "addresses"
  add_foreign_key "patients", "persons"
  add_foreign_key "patients", "persons", column: "doctor_id"
  add_foreign_key "patients", "persons", column: "guardian_id"
  add_foreign_key "patients", "phone_numbers"
  add_foreign_key "persons", "addresses"
  add_foreign_key "persons", "phone_numbers"
  add_foreign_key "phone_numbers", "phone_number_types"
  add_foreign_key "users", "persons"
end
