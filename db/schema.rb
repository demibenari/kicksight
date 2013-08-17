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

ActiveRecord::Schema.define(version: 20130817182845) do

  create_table "categories", force: true do |t|
    t.string "description"
  end

  create_table "dailies", force: true do |t|
    t.integer "pledge_id"
    t.integer "Push_date_id"
    t.string "amount_backers_integer"
    t.integer "amount_pledged"
  end

  create_table "pledges", force: true do |t|
    t.integer "project_id"
    t.integer "min_amount"
    t.string "description"
    t.date "delivery_date"
  end

  create_table "projects", force: true do |t|
    t.string "kick_id"
    t.integer "category_id"
    t.string "name"
    t.string "description"
    t.integer "goal"
    t.date "expiration_date"
    t.string "project_link"
    t.string "picture_link"
    t.string "video_link"
    t.integer "status_id"
  end

  create_table "push_dates", force: true do |t|
    t.date "push_date"
  end

  create_table "statuses", force: true do |t|
    t.string "description"
  end

  create_table "users", force: true do |t|
    t.string "email"
    t.string "password"
  end

end
