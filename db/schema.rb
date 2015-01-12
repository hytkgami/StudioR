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

ActiveRecord::Schema.define(:version => 20150111155819) do

  create_table "booked_materials", :force => true do |t|
    t.integer  "booking_id"
    t.integer  "material_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "booked_materials", ["id"], :name => "index_booked_materials_on_id"

  create_table "bookings", :force => true do |t|
    t.integer  "member_id"
    t.date     "day"
    t.integer  "from"
    t.integer  "to"
    t.integer  "room_id"
    t.string   "book_id"
    t.boolean  "mflag"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "deleted_at"
  end

  add_index "bookings", ["id"], :name => "index_bookings_on_id"
  add_index "bookings", ["member_id"], :name => "index_bookings_on_member_id"

  create_table "material_images", :force => true do |t|
    t.integer  "material_id",                      :null => false
    t.binary   "data",         :limit => 20971520
    t.string   "content_type"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "material_images", ["material_id"], :name => "index_material_images_on_material_id"

  create_table "material_kinds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "material_kinds", ["id"], :name => "index_material_kinds_on_id"

  create_table "materials", :force => true do |t|
    t.string   "name"
    t.integer  "kind_id"
    t.datetime "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "materials", ["id"], :name => "index_materials_on_id"

  create_table "members", :force => true do |t|
    t.string   "name"
    t.string   "tel"
    t.string   "email"
    t.boolean  "administrator",   :default => false, :null => false
    t.datetime "deleted_at"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "hashed_password"
  end

  add_index "members", ["id"], :name => "index_members_on_id"

  create_table "rooms", :force => true do |t|
    t.boolean  "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "rooms", ["id"], :name => "index_rooms_on_id"

end
