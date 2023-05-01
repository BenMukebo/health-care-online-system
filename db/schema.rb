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

ActiveRecord::Schema[7.0].define(version: 2023_05_01_102619) do
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

  create_table "contracts", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "hospital_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.jsonb "terms_of_agreement", default: {}, null: false
    t.decimal "value"
    t.integer "agreement_type"
    t.integer "status", default: 0, null: false
    t.string "legal_document"
    t.boolean "renewal_option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_id"], name: "index_contracts_on_hospital_id"
    t.index ["organization_id"], name: "index_contracts_on_organization_id"
    t.index ["terms_of_agreement"], name: "index_contracts_on_terms_of_agreement", using: :gin
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "phone_number"
    t.string "register_number", limit: 8
    t.string "logo"
    t.string "website"
    t.jsonb "data", default: {}, null: false
    t.jsonb "address", default: {}, null: false
    t.text "terms_of_service"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_hospitals_on_address", using: :gin
    t.index ["data"], name: "index_hospitals_on_data", using: :gin
    t.index ["email"], name: "index_hospitals_on_email"
    t.index ["name"], name: "index_hospitals_on_name"
    t.index ["status"], name: "index_hospitals_on_status"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "phone_number"
    t.string "register_number", limit: 8
    t.string "logo"
    t.string "website"
    t.jsonb "data", default: {}, null: false
    t.jsonb "location", default: {}, null: false
    t.text "terms_of_service"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data"], name: "index_organizations_on_data", using: :gin
    t.index ["location"], name: "index_organizations_on_location", using: :gin
    t.index ["name"], name: "index_organizations_on_name"
    t.index ["status"], name: "index_organizations_on_status"
  end

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
    t.string "matricule_number", limit: 8
    t.string "picture"
    t.string "phone"
    t.text "bio"
    t.integer "marital_status"
    t.string "gender"
    t.jsonb "data", default: "{}", null: false
    t.jsonb "address", default: "{}", null: false
    t.jsonb "phyisical_appearence", default: "{}", null: false
    t.boolean "agreed_to_terms"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "contracts", "hospitals"
  add_foreign_key "contracts", "organizations"
  add_foreign_key "users", "roles"
end
