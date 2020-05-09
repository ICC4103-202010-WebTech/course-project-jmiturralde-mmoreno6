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

ActiveRecord::Schema.define(version: 2020_05_08_214944) do

  create_table "comments", force: :cascade do |t|
    t.integer "commented_id"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "event_invitation_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["event_invitation_id"], name: "index_comments_on_event_invitation_id"
  end

  create_table "event_dates", force: :cascade do |t|
    t.datetime "event_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "event_id"
    t.index ["event_id"], name: "index_event_dates_on_event_id"
  end

  create_table "event_invitations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "event_id"
    t.boolean "report"
    t.index ["event_id"], name: "index_event_invitations_on_event_id"
    t.index ["user_id"], name: "index_event_invitations_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "location"
    t.integer "minimum_guest"
    t.datetime "start_event_date_vote"
    t.boolean "event_rule"
    t.boolean "hidden"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "organization_id"
    t.integer "user_id"
    t.string "title"
    t.string "description"
    t.string "banner_picture"
    t.index ["organization_id"], name: "index_events_on_organization_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "hyper_link_comments", force: :cascade do |t|
    t.string "hyperlink"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "comment_id"
    t.index ["comment_id"], name: "index_hyper_link_comments_on_comment_id"
  end

  create_table "image_comments", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "comment_id"
    t.index ["comment_id"], name: "index_image_comments_on_comment_id"
  end

  create_table "image_event_pages", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "event_id"
    t.index ["event_id"], name: "index_image_event_pages_on_event_id"
  end

  create_table "image_organization_pages", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "organization_id"
    t.index ["organization_id"], name: "index_image_organization_pages_on_organization_id"
  end

  create_table "mail_boxes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_mail_boxes_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "calendar"
    t.integer "notification_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "event_invitation_id"
    t.index ["event_invitation_id"], name: "index_notifications_on_event_invitation_id"
  end

  create_table "organization_invitations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "organization_id"
    t.boolean "admin"
    t.index ["organization_id"], name: "index_organization_invitations_on_organization_id"
    t.index ["user_id"], name: "index_organization_invitations_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "name"
    t.string "description"
    t.string "banner_picture"
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "pdf_event_pages", force: :cascade do |t|
    t.string "pdf"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "event_id"
    t.index ["event_id"], name: "index_pdf_event_pages_on_event_id"
  end

  create_table "pdf_organization_pages", force: :cascade do |t|
    t.string "pdf"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "organization_id"
    t.index ["organization_id"], name: "index_pdf_organization_pages_on_organization_id"
  end

  create_table "profile_pages", force: :cascade do |t|
    t.string "picture"
    t.string "name"
    t.string "last_name"
    t.string "bio"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_profile_pages_on_user_id"
  end

  create_table "received_messages", force: :cascade do |t|
    t.string "sender_username"
    t.string "title"
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "mail_box_id"
    t.index ["mail_box_id"], name: "index_received_messages_on_mail_box_id"
  end

  create_table "send_messages", force: :cascade do |t|
    t.string "receiver_username"
    t.string "title"
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "mail_box_id"
    t.index ["mail_box_id"], name: "index_send_messages_on_mail_box_id"
  end

  create_table "user_votes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "event_date_id"
    t.integer "event_invitation_id"
    t.index ["event_date_id"], name: "index_user_votes_on_event_date_id"
    t.index ["event_invitation_id"], name: "index_user_votes_on_event_invitation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "system_admin"
  end

  create_table "video_event_pages", force: :cascade do |t|
    t.string "video"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "event_id"
    t.index ["event_id"], name: "index_video_event_pages_on_event_id"
  end

  create_table "video_organization_pages", force: :cascade do |t|
    t.string "video"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "organization_id"
    t.index ["organization_id"], name: "index_video_organization_pages_on_organization_id"
  end

  add_foreign_key "comments", "event_invitations"
  add_foreign_key "comments", "events"
  add_foreign_key "event_dates", "events"
  add_foreign_key "event_invitations", "events"
  add_foreign_key "event_invitations", "users"
  add_foreign_key "events", "organizations"
  add_foreign_key "events", "users"
  add_foreign_key "hyper_link_comments", "comments"
  add_foreign_key "image_comments", "comments"
  add_foreign_key "image_event_pages", "events"
  add_foreign_key "image_organization_pages", "organizations"
  add_foreign_key "mail_boxes", "users"
  add_foreign_key "notifications", "event_invitations"
  add_foreign_key "organization_invitations", "organizations"
  add_foreign_key "organization_invitations", "users"
  add_foreign_key "organizations", "users"
  add_foreign_key "pdf_event_pages", "events"
  add_foreign_key "pdf_organization_pages", "organizations"
  add_foreign_key "profile_pages", "users"
  add_foreign_key "received_messages", "mail_boxes"
  add_foreign_key "send_messages", "mail_boxes"
  add_foreign_key "user_votes", "event_dates"
  add_foreign_key "user_votes", "event_invitations"
  add_foreign_key "video_event_pages", "events"
  add_foreign_key "video_organization_pages", "organizations"
end
