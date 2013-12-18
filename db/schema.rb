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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131218115852) do

  create_table "biographical_data", :force => true do |t|
    t.string   "first_name"
    t.string   "surname"
    t.string   "initials"
    t.boolean  "gender"
    t.string   "id_number"
    t.string   "mobile_no"
    t.string   "secondary_no"
    t.boolean  "done_before"
    t.date     "last_assesment_date"
    t.string   "assesment_institution"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "user_id"
  end

  create_table "courses", :force => true do |t|
    t.string   "educational_institution"
    t.string   "course_reapplied"
    t.string   "region"
    t.string   "field_of_study"
    t.integer  "biographical_data_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "document_references", :force => true do |t|
    t.integer  "refrence_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "ref_document_file_name"
    t.string   "ref_document_content_type"
    t.integer  "ref_document_file_size"
    t.datetime "ref_document_updated_at"
  end

  create_table "educations", :force => true do |t|
    t.string   "completion_year"
    t.string   "completed_qualification"
    t.string   "final_result"
    t.string   "endorsment"
    t.string   "subject_1"
    t.string   "mark_1"
    t.string   "subject_2"
    t.string   "mark_2"
    t.string   "subject_3"
    t.string   "mark_3"
    t.string   "subject_4"
    t.string   "mark_4"
    t.string   "subject_5"
    t.string   "mark_5"
    t.string   "subject_6"
    t.string   "mark_6"
    t.string   "subject_7"
    t.string   "mark_7"
    t.string   "subject_8"
    t.string   "mark_8"
    t.string   "subject_9"
    t.string   "mark_9"
    t.integer  "course_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "refrences", :force => true do |t|
    t.text     "activity_description_place"
    t.text     "expirience_from_activity"
    t.string   "skill_1"
    t.string   "skill_1_description"
    t.string   "skill_2"
    t.string   "skill_2_description"
    t.string   "skill_3"
    t.string   "skill_3_description"
    t.string   "referral"
    t.string   "referral_contact_no"
    t.string   "referral_email"
    t.integer  "education_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "supporting_documents", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_supporting_documents", :force => true do |t|
    t.integer  "user_id"
    t.integer  "supporting_document_id"
    t.integer  "document_given"
    t.integer  "certified"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "zip"
    t.string   "phone_number"
    t.boolean  "twitter"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
