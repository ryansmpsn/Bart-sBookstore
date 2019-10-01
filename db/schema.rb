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

ActiveRecord::Schema.define(version: 20171205012143) do

  create_table "authors", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name", limit: 200
    t.string "last_name", limit: 200
  end

  create_table "authors_books", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "book_id", null: false
    t.integer "author_id", null: false
    t.index ["author_id"], name: "fk_rails_d4a76af72d"
    t.index ["book_id"], name: "fk_rails_f7acfea2b6"
  end

  create_table "books", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", limit: 200
    t.decimal "pages", precision: 5
    t.decimal "price", precision: 6, scale: 2
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.integer "cover_file_size"
    t.datetime "cover_updated_at"
    t.string "stock"
  end

  create_table "books_categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "book_id", null: false
    t.integer "category_id", null: false
    t.index ["book_id"], name: "fk_rails_4b64804a3a"
    t.index ["category_id"], name: "fk_rails_426cc1dbb3"
  end

  create_table "books_publishers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "book_id", null: false
    t.integer "publisher_id", null: false
    t.index ["book_id"], name: "fk_rails_5aa5e98203"
    t.index ["publisher_id"], name: "fk_rails_b999b39377"
  end

  create_table "categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 200
  end

  create_table "invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.integer "order_id", null: false
    t.date "invoiceDate"
    t.index ["order_id"], name: "fk_rails_4fa42a6dca"
    t.index ["user_id"], name: "fk_rails_3d1522a0d8"
  end

  create_table "order_items", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "book_id", null: false
    t.integer "order_id", null: false
    t.integer "bookQuantity"
    t.index ["book_id"], name: "fk_rails_24eeff6b07"
    t.index ["order_id"], name: "fk_rails_e3cb28f071"
  end

  create_table "orders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "orderDate"
  end

  create_table "publishers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 200
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "authors_books", "authors"
  add_foreign_key "authors_books", "books"
  add_foreign_key "books_categories", "books"
  add_foreign_key "books_categories", "categories"
  add_foreign_key "books_publishers", "books"
  add_foreign_key "books_publishers", "publishers"
  add_foreign_key "invoices", "orders"
  add_foreign_key "invoices", "users"
  add_foreign_key "order_items", "books"
  add_foreign_key "order_items", "orders"
end
