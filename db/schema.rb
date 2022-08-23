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

ActiveRecord::Schema.define(version: 2022_08_22_184411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conferences", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_conferences_on_name"
  end

  create_table "lectures", force: :cascade do |t|
    t.string "title"
    t.integer "duration"
    t.string "lecturer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.time "start_at"
    t.bigint "track_id", null: false
    t.index ["duration"], name: "index_lectures_on_duration"
    t.index ["title"], name: "index_lectures_on_title"
    t.index ["track_id"], name: "index_lectures_on_track_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.integer "name"
    t.bigint "conference_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conference_id"], name: "index_tracks_on_conference_id"
    t.index ["name"], name: "index_tracks_on_name"
  end

  add_foreign_key "lectures", "tracks"
end
