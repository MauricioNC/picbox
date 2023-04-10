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

ActiveRecord::Schema.define(version: 2023_04_10_223717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boxes", force: :cascade do |t|
    t.string "box_name"
    t.string "description"
    t.string "identifier"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_boxes_on_user_id"
  end

  create_table "boxes_images", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "image_id", null: false
    t.bigint "box_id", null: false
    t.index ["user_id"], name: "index_boxes_images_on_user_id"
  end

  create_table "boxes_tags", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "box_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["box_id"], name: "index_boxes_tags_on_box_id"
    t.index ["tag_id"], name: "index_boxes_tags_on_tag_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.string "identifier"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "images_downloads", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "image_id", null: false
    t.index ["user_id"], name: "index_images_downloads_on_user_id"
  end

  create_table "images_likes", force: :cascade do |t|
    t.bigint "image_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image_id"], name: "index_images_likes_on_image_id"
    t.index ["user_id"], name: "index_images_likes_on_user_id"
  end

  create_table "images_tags", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "image_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image_id"], name: "index_images_tags_on_image_id"
    t.index ["tag_id"], name: "index_images_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_interests", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag_id"], name: "index_user_interests_on_tag_id"
    t.index ["user_id"], name: "index_user_interests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "password_confirm"
    t.string "location"
    t.string "phone_number"
    t.boolean "is_admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "boxes", "users"
  add_foreign_key "boxes_images", "users"
  add_foreign_key "boxes_tags", "boxes"
  add_foreign_key "boxes_tags", "tags"
  add_foreign_key "images", "users"
  add_foreign_key "images_downloads", "users"
  add_foreign_key "images_likes", "images"
  add_foreign_key "images_likes", "users"
  add_foreign_key "images_tags", "images"
  add_foreign_key "images_tags", "tags"
  add_foreign_key "user_interests", "tags"
  add_foreign_key "user_interests", "users"
end
