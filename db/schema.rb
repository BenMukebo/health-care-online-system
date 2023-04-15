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

ActiveRecord::Schema[7.0].define(version: 2023_04_15_132731) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "roles", force: :cascade do |t|
    t.integer "name", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "familly_name"
    t.string "middle_name"
    t.integer "matricule_number"
    t.string "picture"
    t.string "phone"
    t.string "bio"
    t.integer "marital_status"
    t.string "gender"
    t.jsonb "data", default: "{}", null: false
    t.jsonb "address", default: "{}", null: false
    t.jsonb "phyisical_appearence", default: "{}", null: false
    t.string "privacy_policy"
    t.integer "status", default: 0, null: false
    t.bigint "role_id", null: false
    t.index ["address"], name: "index_users_on_address", using: :gin
    t.index ["data"], name: "index_users_on_data", using: :gin
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["matricule_number"], name: "index_users_on_matricule_number", unique: true
    t.index ["phyisical_appearence"], name: "index_users_on_phyisical_appearence", using: :gin
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "users", "roles"
end
