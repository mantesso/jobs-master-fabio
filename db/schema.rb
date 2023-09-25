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

ActiveRecord::Schema[7.0].define(version: 2023_09_25_140438) do
  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "life_points"
    t.integer "attack_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fights", force: :cascade do |t|
    t.integer "character1_id", null: false
    t.integer "character2_id", null: false
    t.integer "winner_id"
    t.integer "weapon1_id"
    t.integer "weapon2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character1_id"], name: "index_fights_on_character1_id"
    t.index ["character2_id"], name: "index_fights_on_character2_id"
    t.index ["weapon1_id"], name: "index_fights_on_weapon1_id"
    t.index ["weapon2_id"], name: "index_fights_on_weapon2_id"
    t.index ["winner_id"], name: "index_fights_on_winner_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "attack_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fights", "characters", column: "character1_id"
  add_foreign_key "fights", "characters", column: "character2_id"
  add_foreign_key "fights", "characters", column: "winner_id"
  add_foreign_key "fights", "weapons", column: "weapon1_id"
  add_foreign_key "fights", "weapons", column: "weapon2_id"
end
