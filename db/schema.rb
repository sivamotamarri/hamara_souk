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

ActiveRecord::Schema.define(:version => 20120518065409) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email"
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token"

  create_table "ads", :force => true do |t|
    t.string   "title"
    t.decimal  "size",                   :precision => 10, :scale => 0
    t.decimal  "fee",                    :precision => 10, :scale => 0
    t.integer  "bed_rooms"
    t.integer  "bath_rooms"
    t.string   "developer"
    t.date     "ready_date"
    t.decimal  "annual_comm_fee",        :precision => 10, :scale => 0
    t.string   "amenities"
    t.integer  "section_id"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.decimal  "price",                  :precision => 10, :scale => 0
    t.string   "property_refer"
    t.integer  "mobile_number"
    t.text     "desc"
    t.string   "full_name"
    t.string   "company_name"
    t.string   "broker_id"
    t.boolean  "agent_or_landlord"
    t.boolean  "complete_or_incomplete"
    t.boolean  "active_status"
    t.string   "street"
    t.string   "city"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "tags"
    t.boolean  "gmaps"
    t.string   "country"
    t.string   "slug"
    t.string   "listed_by"
    t.string   "ad_condition"
    t.decimal  "compensation",           :precision => 10, :scale => 0
    t.string   "ad_usage"
    t.string   "ad_age"
    t.text     "ad_description"
    t.string   "work_experience"
    t.string   "education_level"
    t.string   "commitment"
    t.string   "brand"
    t.string   "warranty"
    t.string   "type"
    t.string   "length"
  end

  add_index "ads", ["ad_age"], :name => "index_ads_on_ad_age"
  add_index "ads", ["ad_condition"], :name => "index_ads_on_ad_condition"
  add_index "ads", ["ad_usage"], :name => "index_ads_on_ad_usage"
  add_index "ads", ["brand"], :name => "index_ads_on_brand"
  add_index "ads", ["category_id"], :name => "index_ads_on_category_id"
  add_index "ads", ["commitment"], :name => "index_ads_on_commitment"
  add_index "ads", ["company_name"], :name => "index_ads_on_company_name"
  add_index "ads", ["compensation"], :name => "index_ads_on_compensation"
  add_index "ads", ["education_level"], :name => "index_ads_on_education_level"
  add_index "ads", ["length"], :name => "index_ads_on_length"
  add_index "ads", ["listed_by"], :name => "index_ads_on_listed_by"
  add_index "ads", ["section_id"], :name => "index_ads_on_section_id"
  add_index "ads", ["slug"], :name => "index_ads_on_slug"
  add_index "ads", ["title"], :name => "index_ads_on_title"
  add_index "ads", ["type"], :name => "index_ads_on_type"
  add_index "ads", ["user_id"], :name => "index_ads_on_user_id"
  add_index "ads", ["warranty"], :name => "index_ads_on_warranty"
  add_index "ads", ["work_experience"], :name => "index_ads_on_work_experience"

  create_table "amenities", :force => true do |t|
    t.string   "title"
    t.integer  "section_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", :force => true do |t|
    t.string   "type"
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "categories", :force => true do |t|
    t.integer  "parent_id"
    t.string   "name"
    t.string   "desc"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "section_id"
    t.string   "slug"
  end

  add_index "categories", ["slug"], :name => "index_categories_on_slug"

  create_table "cities", :force => true do |t|
    t.string "name"
    t.string "state"
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "desc"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "state",        :default => true
    t.integer  "topics_count", :default => 0
    t.integer  "posts_count",  :default => 0
    t.integer  "position",     :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "posts", :force => true do |t|
    t.text     "body"
    t.integer  "forum_id"
    t.integer  "topic_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "replies", :force => true do |t|
    t.integer  "ad_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", :force => true do |t|
    t.integer  "ad_id"
    t.string   "spam"
    t.text     "fraud_desc"
    t.boolean  "miscategorized",     :default => false
    t.boolean  "repetitive_listing", :default => false
    t.integer  "reported_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "ad_id"
    t.integer  "user_id"
    t.text     "desc"
    t.integer  "rating"
    t.integer  "pricing"
    t.string   "delivery",       :default => "Dont know"
    t.string   "outdoor_dining", :default => "Dont know"
    t.string   "take_out",       :default => "Dont know"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "sections", ["slug"], :name => "index_sections_on_slug"

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.integer  "hits",        :default => 0
    t.boolean  "sticky",      :default => false
    t.boolean  "locked",      :default => false
    t.integer  "posts_count"
    t.integer  "forum_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "gender"
    t.string   "country"
    t.string   "professional"
    t.date     "dob"
    t.boolean  "hamara_souk_updates",                   :default => false
    t.boolean  "allow_adv",                             :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unconfirmed_email"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "topics_count",                          :default => 0
    t.integer  "posts_count",                           :default => 0
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token"
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token"
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token"

  create_table "watchings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ad_id"
    t.string   "ad_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
