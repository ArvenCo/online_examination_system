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

ActiveRecord::Schema[7.1].define(version: 2023_12_07_151751) do
  create_table "answers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "choice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id"], name: "index_answers_on_choice_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "choices", force: :cascade do |t|
    t.integer "item_id", null: false
    t.string "option"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_choices_on_item_id"
  end

  create_table "exams", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.integer "timer", default: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_exams_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "exam_id", null: false
    t.string "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_items_on_exam_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "username", null: false
    t.string "password_digest", null: false
    t.string "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "choices"
  add_foreign_key "answers", "users"
  add_foreign_key "choices", "items"
  add_foreign_key "exams", "users"
  add_foreign_key "items", "exams"
end
