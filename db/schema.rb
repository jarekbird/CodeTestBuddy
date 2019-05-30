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

ActiveRecord::Schema.define(version: 2019_05_30_165709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "compatibilities", force: :cascade do |t|
    t.bigint "stuffed_animal_id", null: false
    t.bigint "accessory_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accessory_id"], name: "index_compatibilities_on_accessory_id"
    t.index ["stuffed_animal_id"], name: "index_compatibilities_on_stuffed_animal_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "order_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "description", null: false
    t.integer "size"
    t.integer "quantity", default: 0, null: false
    t.float "cost", null: false
    t.float "sale_price", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description"], name: "index_products_on_description"
    t.index ["size"], name: "index_products_on_size"
    t.index ["type"], name: "index_products_on_type"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_purchases_on_order_id"
    t.index ["product_id"], name: "index_purchases_on_product_id"
  end

  add_foreign_key "compatibilities", "products", column: "accessory_id"
  add_foreign_key "compatibilities", "products", column: "stuffed_animal_id"
  add_foreign_key "purchases", "orders"
  add_foreign_key "purchases", "products"
end
