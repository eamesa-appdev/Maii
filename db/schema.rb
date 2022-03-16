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

ActiveRecord::Schema.define(version: 2022_03_16_155023) do

  create_table "administradoras", force: :cascade do |t|
    t.string "nombre_administradora"
    t.string "tipo_adminsitradora"
    t.integer "fondos_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favoritos", force: :cascade do |t|
    t.integer "participacion_id"
    t.integer "user_id"
    t.date "exit_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "funds", force: :cascade do |t|
    t.string "nombre_fondo"
    t.integer "administradora_id"
    t.string "tipo_fondo"
    t.string "codigo_tipo_fondo"
    t.integer "tipo_participaciones_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "participacions", force: :cascade do |t|
    t.integer "fund_id"
    t.integer "codigo_participaciones"
    t.float "valor_fondo"
    t.float "rentabilidad_diaria"
    t.float "rentabilidad_mensual"
    t.float "rentabilidad_semestral"
    t.float "rentabilidad_anual"
    t.integer "numero_inversionistas"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
