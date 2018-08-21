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


ActiveRecord::Schema.define(version: 2018_08_21_023220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


  create_table "brands", force: :cascade do |t|
    t.string "name"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "survey_response_id"
    t.json "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["survey_response_id"], name: "index_answers_on_survey_response_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "gender"
    t.string "occupation"
    t.date "brithday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fit_tops", force: :cascade do |t|
    t.integer "neck_circumference"
    t.integer "shoulder_width"
    t.integer "arm_length"
    t.integer "center_back"
    t.integer "chest_width"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "vpn"
    t.string "style"
    t.string "sku"
    t.bigint "barcode"
    t.string "size"
    t.integer "neck_circumference"
    t.integer "shoulder_width"
    t.integer "arm_length"
    t.integer "center_back"
    t.integer "chest_width"
    t.integer "waist_circumference"
    t.integer "inner_leg"
    t.integer "outer_leg"
    t.integer "thigh_circumference"
    t.integer "glutes"
    t.decimal "cost_price"
    t.decimal "rrp"
    t.decimal "sale_price"
    t.string "photo_id"
    t.bigint "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end


  create_table "questions", force: :cascade do |t|
    t.bigint "survey_id"
    t.json "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "survey_responses", force: :cascade do |t|
    t.bigint "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_survey_responses_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  add_foreign_key "products", "brands"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "survey_responses"
  add_foreign_key "questions", "surveys"
  add_foreign_key "survey_responses", "surveys"
end
