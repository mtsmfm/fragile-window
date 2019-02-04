# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_04_175213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "test_example_results", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "result", null: false
    t.decimal "run_time", null: false
    t.uuid "test_example_id"
    t.uuid "test_suite_result_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_example_id"], name: "index_test_example_results_on_test_example_id"
    t.index ["test_suite_result_id"], name: "index_test_example_results_on_test_suite_result_id"
  end

  create_table "test_examples", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "classname", null: false
    t.string "file", null: false
    t.boolean "pending", default: false, null: false
    t.uuid "test_suite_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_suite_id"], name: "index_test_examples_on_test_suite_id"
  end

  create_table "test_suite_results", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.xml "data", null: false
    t.uuid "test_suite_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_suite_id"], name: "index_test_suite_results_on_test_suite_id"
  end

  create_table "test_suites", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "test_example_results", "test_examples"
  add_foreign_key "test_example_results", "test_suite_results"
  add_foreign_key "test_examples", "test_suites"
  add_foreign_key "test_suite_results", "test_suites"
end
