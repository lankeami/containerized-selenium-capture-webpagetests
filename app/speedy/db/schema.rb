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

ActiveRecord::Schema.define(version: 20171021122711) do

  create_table "urls", force: :cascade do |t|
    t.string "title"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wpts", force: :cascade do |t|
    t.integer "url_id"
    t.decimal "load_t"
    t.decimal "first_byte_t"
    t.decimal "dom_interactive_t"
    t.decimal "document_complete_t"
    t.integer "request_count"
    t.decimal "speed_index"
    t.text "ref"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url_id"], name: "index_wpts_on_url_id"
  end

end
