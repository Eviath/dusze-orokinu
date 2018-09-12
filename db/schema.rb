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

ActiveRecord::Schema.define(version: 20180911152232) do

  create_table "alliancerequests", force: :cascade do |t|
    t.string "nickname"
    t.string "lider_nickname"
    t.string "clan_name"
    t.integer "clan_members"
    t.string "clan_tier"
    t.text "clan_about"
    t.boolean "discord_check", default: false
    t.boolean "rules_check", default: false
    t.integer "user_id"
    t.boolean "approval"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_alliancerequests_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_alliancerequests_on_user_id"
  end

  create_table "clans", force: :cascade do |t|
    t.string "leader"
    t.string "name"
    t.text "about"
    t.integer "members"
    t.string "tier"
    t.string "picture"
    t.integer "user_id"
    t.boolean "approval", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_clans_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_clans_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "author_id"
    t.integer "receiver_id"
    t.boolean "author_deleted", default: false
    t.boolean "receiver_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id", "receiver_id"], name: "index_conversations_on_author_id_and_receiver_id", unique: true
    t.index ["author_id"], name: "index_conversations_on_author_id"
    t.index ["receiver_id"], name: "index_conversations_on_receiver_id"
  end

  create_table "personal_messages", force: :cascade do |t|
    t.text "body"
    t.integer "conversation_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_personal_messages_on_conversation_id"
    t.index ["user_id"], name: "index_personal_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean "lider", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
