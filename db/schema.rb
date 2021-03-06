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

ActiveRecord::Schema.define(version: 2018_04_30_193249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "postings", force: :cascade do |t|
    t.string "company_name"
    t.string "position_name"
    t.text "link"
    t.text "summary"
    t.string "summary_name"
    t.text "qualifications"
    t.string "qualifications_name"
    t.text "duties"
    t.string "duties_name"
    t.string "additional_comments_name"
    t.text "additional_comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "radio_summary"
    t.string "radio_duties"
    t.string "radio_qualifications"
    t.string "radio_additional_comments"
    t.string "radio_last_section"
    t.text "last_section"
    t.string "last_section_name"
  end

end
