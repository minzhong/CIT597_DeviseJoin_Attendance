# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150417015149) do

  create_table "attendances", force: :cascade do |t|
    t.date     "att_date"
    t.time     "att_time"
    t.text     "note"
    t.integer  "course_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendances", ["course_id"], name: "index_attendances_on_course_id"
  add_index "attendances", ["student_id"], name: "index_attendances_on_student_id"

  create_table "courses", force: :cascade do |t|
    t.string   "course_code"
    t.string   "course_name"
    t.string   "term"
    t.integer  "year"
    t.text     "note"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "courses", ["user_id"], name: "index_courses_on_user_id"

  create_table "courses_students", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "student_id"
  end

  add_index "courses_students", ["course_id"], name: "index_courses_students_on_course_id"
  add_index "courses_students", ["student_id"], name: "index_courses_students_on_student_id"

  create_table "instructors", force: :cascade do |t|
    t.string   "user_name"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "pennid"
    t.string   "email"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
