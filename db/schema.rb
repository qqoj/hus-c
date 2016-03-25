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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160325163939) do

  create_table "blueprints", force: :cascade do |t|
    t.integer "type_id"
    t.text    "activities"
    t.integer "limit"
  end

  add_index "blueprints", ["type_id"], name: "index_blueprints_on_type_id", unique: true

  create_table "eve_names", force: :cascade do |t|
    t.integer "type_id"
    t.string  "value"
  end

  add_index "eve_names", ["type_id"], name: "index_eve_names_on_type_id", unique: true

end
