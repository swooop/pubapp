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

ActiveRecord::Schema.define(:version => 20130426124837) do

  create_table "beers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "brewery_id"
  end

  create_table "beers_pubs", :id => false, :force => true do |t|
    t.integer "beer_id"
    t.integer "pub_id"
  end

  create_table "breweries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "breweries_pubs", :id => false, :force => true do |t|
    t.integer "brewery_id"
    t.integer "pub_id"
  end

  create_table "locations", :force => true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pubs", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.integer  "area_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "pubs", ["area_id"], :name => "index_pubs_on_area_id"
  add_index "pubs", ["location_id"], :name => "index_pubs_on_location_id"

  create_table "users", :force => true do |t|
    t.string   "name_first"
    t.string   "name_last"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

  create_table "visits", :force => true do |t|
    t.date     "visited_on"
    t.integer  "user_id"
    t.integer  "pub_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "visits", ["pub_id"], :name => "index_visits_on_pub_id"
  add_index "visits", ["user_id"], :name => "index_visits_on_user_id"

end
