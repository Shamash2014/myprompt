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

ActiveRecord::Schema[7.1].define(version: 2023_11_29_211735) do
  create_schema "prompts_20231129091345"

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "_dlt_loads", id: false, force: :cascade do |t|
    t.string "load_id", null: false
    t.string "schema_name"
    t.bigint "status", null: false
    t.timestamptz "inserted_at", null: false
    t.string "schema_version_hash"
  end

  create_table "_dlt_pipeline_state", id: false, force: :cascade do |t|
    t.bigint "version", null: false
    t.bigint "engine_version", null: false
    t.string "pipeline_name", null: false
    t.string "state", null: false
    t.timestamptz "created_at", null: false
    t.string "_dlt_load_id", null: false
    t.string "_dlt_id", null: false

    t.unique_constraint ["_dlt_id"], name: "_dlt_pipeline_state__dlt_id_key"
  end

  create_table "_dlt_version", id: false, force: :cascade do |t|
    t.bigint "version", null: false
    t.bigint "engine_version", null: false
    t.timestamptz "inserted_at", null: false
    t.string "schema_name", null: false
    t.string "version_hash", null: false
    t.string "schema", null: false
  end

  create_table "prompts", force: :cascade do |t|
    t.text "prompt"
    t.string "_dlt_id"
    t.string "_dlt_load_id"
  end

end
