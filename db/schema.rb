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

ActiveRecord::Schema.define(version: 20180513121842) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_posts", force: :cascade do |t|
    t.integer "category_id"
    t.integer "post_id"
  end

  create_table "collections", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_collections_on_post_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "apply_friend_id"
    t.integer "friend_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "title", limit: 60, default: "N/A", null: false
    t.text "detail"
    t.string "img"
    t.string "who_can_see", default: "all"
    t.integer "replies_count", default: 0
    t.integer "viewed_count", default: 0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_published", default: true
    t.datetime "last_replied_at"
    t.integer "category_ids"
    t.index ["replies_count"], name: "index_posts_on_replies_count"
    t.index ["user_id"], name: "index_posts_on_user_id"
    t.index ["viewed_count"], name: "index_posts_on_viewed_count"
  end

  create_table "replies", force: :cascade do |t|
    t.text "comment"
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_replies_on_post_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.boolean "is_admin", default: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level", default: "2"
    t.text "description"
    t.string "avatar"
    t.integer "replies_count", default: 0
    t.string "authentication_token"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
