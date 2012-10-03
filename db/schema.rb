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

ActiveRecord::Schema.define(:version => 20121003120308) do

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.string   "image"
    t.string   "personality"
    t.string   "quotes"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "headline"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "scene_id"
    t.integer  "character_id"
    t.integer  "location_id"
    t.integer  "music_id"
    t.integer  "inspiration_id"
    t.string   "comments"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "inspirations", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "l_ocations", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.string   "image"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "musics", :force => true do |t|
    t.string   "title"
    t.integer  "project_id"
    t.string   "artist"
    t.string   "spotify_uri"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "synopsis"
    t.string   "genres"
    t.string   "format"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scenes", :force => true do |t|
    t.string   "title"
    t.integer  "project_id"
    t.string   "image"
    t.string   "entry"
    t.string   "themes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
