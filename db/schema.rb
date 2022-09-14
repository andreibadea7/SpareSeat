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

ActiveRecord::Schema[7.0].define(version: 2022_09_14_084018) do
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

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.bigint "participant_one_id", null: false
    t.bigint "participant_two_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_one_id"], name: "index_chatrooms_on_participant_one_id"
    t.index ["participant_two_id"], name: "index_chatrooms_on_participant_two_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "date"
    t.string "name"
    t.bigint "venue_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "events_performers", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "performer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_events_performers_on_event_id"
    t.index ["performer_id"], name: "index_events_performers_on_performer_id"
  end

  create_table "images", force: :cascade do |t|
    t.text "image_url"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "chatroom_id", null: false
    t.bigint "sender_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "checkout_session_id"
    t.bigint "user_id", null: false
    t.bigint "ticket_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount_cents", default: 0, null: false
    t.index ["ticket_id"], name: "index_orders_on_ticket_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "performers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "owner_id", null: false
    t.boolean "for_sale", default: true
    t.string "seat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "code"
    t.index ["event_id"], name: "index_tickets_on_event_id"
    t.index ["owner_id"], name: "index_tickets_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "country"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chatrooms", "users", column: "participant_one_id"
  add_foreign_key "chatrooms", "users", column: "participant_two_id"
  add_foreign_key "events", "venues"
  add_foreign_key "events_performers", "events"
  add_foreign_key "events_performers", "performers"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "orders", "tickets"
  add_foreign_key "orders", "users"
  add_foreign_key "tickets", "events"
  add_foreign_key "tickets", "users", column: "owner_id"
end
