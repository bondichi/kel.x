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

ActiveRecord::Schema.define(version: 2018_08_24_031601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "survey_response_id"
    t.json "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["survey_response_id"], name: "index_answers_on_survey_response_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_cart_items_on_product_id"
    t.index ["user_id"], name: "index_cart_items_on_user_id"
  end

  create_table "fit_bottoms", force: :cascade do |t|
    t.integer "waist_circumference"
    t.integer "inner_leg"
    t.integer "outer_leg"
    t.integer "thigh_circumference"
    t.integer "glutes"
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

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "product_price_cents"
    t.bigint "order_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.integer "amount_cents"
    t.jsonb "payment"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
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
    t.integer "cost_price"
    t.integer "rrp"
    t.integer "sale_price"
    t.string "photo_id"
    t.bigint "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "category"
    t.integer "cost_price_cents", default: 0, null: false
    t.integer "rrp_cents", default: 0, null: false
    t.integer "sale_price_cents", default: 0, null: false
    t.string "vendor"
    t.string "style_number"
    t.string "size_code"
    t.string "sub_category"
    t.string "fabric_composition"
    t.string "silhouette"
    t.string "main_colour"
    t.string "print_wash"
    t.string "photo"
    t.index ["brand_id"], name: "index_products_on_brand_id"
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
    t.integer "user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "survey_id"
    t.json "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.integer "number"
    t.string "street"
    t.string "suburb"
    t.string "city"
    t.string "state"
    t.bigint "profile_id"
    t.string "special"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_code"
    t.index ["profile_id"], name: "index_shipping_addresses_on_profile_id"
  end

  create_table "survey_responses", force: :cascade do |t|
    t.bigint "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.index ["survey_id"], name: "index_survey_responses_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "survey_responses"
  add_foreign_key "cart_items", "products"
  add_foreign_key "cart_items", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "orders"
  add_foreign_key "products", "brands"
  add_foreign_key "profiles", "users"
  add_foreign_key "questions", "surveys"
  add_foreign_key "shipping_addresses", "profiles"
  add_foreign_key "survey_responses", "profiles"
  add_foreign_key "survey_responses", "surveys"
end
