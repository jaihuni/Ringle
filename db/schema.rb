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

ActiveRecord::Schema[7.0].define(version: 2023_05_07_070612) do
  create_table "group_musics", force: :cascade do |t|
    t.integer "group_playlist_id", null: false
    t.integer "music_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_playlist_id"], name: "index_group_musics_on_group_playlist_id"
    t.index ["music_id"], name: "index_group_musics_on_music_id"
    t.index ["user_id"], name: "index_group_musics_on_user_id"
  end

  create_table "group_playlists", force: :cascade do |t|
    t.string "name"
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_playlists_on_group_id"
  end

  create_table "group_users", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "list_musics", force: :cascade do |t|
    t.integer "playlist_id", null: false
    t.integer "music_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_id"], name: "index_list_musics_on_music_id"
    t.index ["playlist_id"], name: "index_list_musics_on_playlist_id"
  end

  create_table "musics", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.string "album"
    t.integer "like", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.string "title"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "group_musics", "group_playlists"
  add_foreign_key "group_musics", "musics"
  add_foreign_key "group_musics", "users"
  add_foreign_key "group_playlists", "groups"
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
  add_foreign_key "list_musics", "musics"
  add_foreign_key "list_musics", "playlists"
  add_foreign_key "playlists", "users"
end
