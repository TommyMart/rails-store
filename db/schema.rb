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

ActiveRecord::Schema[8.0].define(version: 2025_02_10_060407) do
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

  create_table "cars", force: :cascade do |t|
    t.string "make"
    t.integer "year"
    t.integer "speedo"
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_cars_on_owner_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "number"
    t.string "mechanics"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "car_id", null: false
    t.float "total_time"
    t.boolean "completed"
    t.decimal "cost"
    t.text "parts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_jobs_on_car_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repairs", force: :cascade do |t|
    t.integer "car_id", null: false
    t.integer "mechanic_id", null: false
    t.decimal "cost"
    t.text "description"
    t.integer "invoice_id", null: false
    t.string "mechanic_shop"
    t.datetime "repair_date"
    t.boolean "completed"
    t.integer "time_spent"
    t.string "parts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_repairs_on_car_id"
    t.index ["invoice_id"], name: "index_repairs_on_invoice_id"
    t.index ["mechanic_id"], name: "index_repairs_on_mechanic_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cars", "owners"
  add_foreign_key "jobs", "cars"
  add_foreign_key "jobs", "users"
  add_foreign_key "repairs", "cars"
  add_foreign_key "repairs", "invoices"
  add_foreign_key "repairs", "mechanics"
end
