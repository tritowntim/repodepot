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

ActiveRecord::Schema.define(:version => 20130128192908) do

  create_table "listings", :force => true do |t|
    t.integer  "list_id"
    t.integer  "repository_id"
    t.text     "commentary"
    t.integer  "ordering"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "lists", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  create_table "repositories", :force => true do |t|
    t.string   "full_name"
    t.string   "owner_login"
    t.string   "name"
    t.datetime "gh_created_at"
    t.datetime "gh_updated_at"
    t.datetime "pushed_at"
    t.integer  "watchers_count"
    t.integer  "forks_count"
    t.integer  "open_issues_count"
    t.integer  "network_count"
    t.string   "language"
    t.text     "description"
    t.string   "clone_url"
    t.string   "html_url"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "github_id"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
