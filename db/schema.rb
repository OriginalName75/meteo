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

ActiveRecord::Schema.define(version: 20170309014941) do

  create_table "lieus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nom"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.float    "latitude",         limit: 24
    t.float    "longitude",        limit: 24
    t.string   "address"
    t.integer  "openW"
    t.datetime "lastMesureUpdate"
  end

  create_table "mesures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "t"
    t.integer  "vitessevent"
    t.integer  "lieu_id"
    t.float    "temperature", limit: 24
    t.integer  "rasb_id"
    t.integer  "user_id"
    t.integer  "rasb_sec_id"
    t.float    "humidite",    limit: 24
    t.float    "pression",    limit: 24
    t.index ["lieu_id"], name: "index_mesures_on_lieu_id", using: :btree
    t.index ["rasb_id"], name: "index_mesures_on_rasb_id", using: :btree
    t.index ["rasb_sec_id"], name: "index_mesures_on_rasb_sec_id", using: :btree
    t.index ["user_id"], name: "index_mesures_on_user_id", using: :btree
  end

  create_table "rasb", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "password"
    t.string   "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rasb_secs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "login",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
    t.integer  "lieu_id"
    t.index ["lieu_id"], name: "index_rasb_secs_on_lieu_id", using: :btree
    t.index ["login"], name: "index_rasb_secs_on_login", unique: true, using: :btree
    t.index ["user_id"], name: "index_rasb_secs_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "isAdmin",                default: false, null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "nom"
    t.string   "prenom"
    t.string   "username"
    t.integer  "affichage",              default: 0,     null: false
    t.boolean  "affichageMail",          default: false, null: false
    t.boolean  "affichageNomPrenom",     default: true,  null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_lieus", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "lieu_id"
    t.index ["lieu_id"], name: "index_users_lieus_on_lieu_id", using: :btree
    t.index ["user_id"], name: "index_users_lieus_on_user_id", using: :btree
  end

end
