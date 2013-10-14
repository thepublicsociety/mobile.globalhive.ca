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

ActiveRecord::Schema.define(:version => 20130910220948) do

  create_table "contents", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "body"
    t.boolean  "published",  :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "item_attachments", :force => true do |t|
    t.text     "caption"
    t.integer  "item_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "item_image_file_name"
    t.string   "item_image_content_type"
    t.integer  "item_image_file_size"
    t.datetime "item_image_updated_at"
    t.text     "caption_french"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "body"
    t.text     "description"
    t.boolean  "featured",                :default => false
    t.boolean  "active",                  :default => true
    t.string   "category"
    t.string   "subcategory"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "panel_id"
    t.string   "size"
    t.string   "related_modules"
    t.string   "feature_title"
    t.string   "name_french"
    t.text     "body_french"
    t.string   "title_french"
    t.string   "subcategory_french"
    t.string   "feature_title_french"
    t.string   "item_photo_file_name"
    t.string   "item_photo_content_type"
    t.integer  "item_photo_file_size"
    t.datetime "item_photo_updated_at"
    t.string   "itemphoto_file_name"
    t.string   "itemphoto_content_type"
    t.integer  "itemphoto_file_size"
    t.datetime "itemphoto_updated_at"
    t.string   "i_p_caption"
    t.string   "i_p_caption_french"
    t.string   "i_p_width"
    t.string   "i_p_height"
    t.string   "i_p_crop_x"
    t.string   "i_p_crop_y"
    t.string   "i_p_crop_w"
    t.string   "i_p_crop_h"
    t.integer  "number"
  end

  create_table "panel_attachments", :force => true do |t|
    t.text     "caption"
    t.integer  "panel_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "panel_image_file_name"
    t.string   "panel_image_content_type"
    t.integer  "panel_image_file_size"
    t.datetime "panel_image_updated_at"
  end

  create_table "panels", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "category"
    t.string   "subcategory"
    t.string   "color"
    t.text     "body"
    t.text     "description"
    t.boolean  "featured",         :default => false
    t.boolean  "active",           :default => true
    t.integer  "panel_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "number"
    t.string   "name_french"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
  end

  create_table "post_attachments", :force => true do |t|
    t.text     "caption"
    t.integer  "post_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "post_image_file_name"
    t.string   "post_image_content_type"
    t.integer  "post_image_file_size"
    t.datetime "post_image_updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "body"
    t.string   "date"
    t.boolean  "active",       :default => true
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.text     "body_french"
    t.text     "title_french"
  end

  create_table "section_attachments", :force => true do |t|
    t.string   "label"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "section_upload_file_name"
    t.string   "section_upload_content_type"
    t.integer  "section_upload_file_size"
    t.datetime "section_upload_updated_at"
    t.integer  "section_id"
  end

  create_table "sections", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "active",       :default => true
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "title_french"
    t.text     "body_french"
  end

  create_table "terms", :force => true do |t|
    t.string   "name"
    t.text     "definition"
    t.boolean  "active",            :default => true
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "name_french"
    t.text     "definition_french"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
