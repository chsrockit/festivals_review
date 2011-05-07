# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110507120439) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.integer  "festival_id"
    t.integer  "show_id"
    t.integer  "venue_id"
    t.float    "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "event_time"
  end

  create_table "festivals", :force => true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.float    "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "show_id"
    t.string   "author"
    t.float    "score"
    t.text     "body_text"
    t.string   "source"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "review_date"
  end

  create_table "shows", :force => true do |t|
    t.integer  "festival_id",                :null => false
    t.integer  "venue_id",                   :null => false
    t.string   "name",        :limit => 100, :null => false
    t.string   "description",                :null => false
    t.string   "genre",       :limit => 30,  :null => false
    t.datetime "start_date",                 :null => false
    t.datetime "end_date",                   :null => false
    t.float    "score",                      :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "official_id"
  end

  create_table "venues", :force => true do |t|
    t.string   "name",        :limit => 100, :null => false
    t.integer  "festival_id",                :null => false
    t.string   "address",     :limit => 100, :null => false
    t.float    "score",                      :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

end
