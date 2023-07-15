# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_13_173026) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auth_group", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 150, null: false
    t.index ["name"], name: "auth_group_name_a6ea08ec_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "auth_group_name_key", unique: true
  end

  create_table "auth_group_permissions", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_0cd325b0_uniq", unique: true
    t.index ["group_id"], name: "auth_group_permissions_group_id_b120cbf9"
    t.index ["permission_id"], name: "auth_group_permissions_permission_id_84c5c92e"
  end

  create_table "auth_permission", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "content_type_id", null: false
    t.string "codename", limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_01ab375a_uniq", unique: true
    t.index ["content_type_id"], name: "auth_permission_content_type_id_2f476e4b"
  end

  create_table "auth_user", id: :integer, default: nil, force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.timestamptz "last_login"
    t.boolean "is_superuser", null: false
    t.string "username", limit: 150, null: false
    t.string "first_name", limit: 150, null: false
    t.string "last_name", limit: 150, null: false
    t.string "email", limit: 254, null: false
    t.boolean "is_staff", null: false
    t.boolean "is_active", null: false
    t.timestamptz "date_joined", null: false
    t.index ["username"], name: "auth_user_username_6821ab7c_like", opclass: :varchar_pattern_ops
    t.index ["username"], name: "auth_user_username_key", unique: true
  end

  create_table "auth_user_groups", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "auth_user_groups_group_id_97559544"
    t.index ["user_id", "group_id"], name: "auth_user_groups_user_id_group_id_94350c0c_uniq", unique: true
    t.index ["user_id"], name: "auth_user_groups_user_id_6a12ed8b"
  end

  create_table "auth_user_user_permissions", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "auth_user_user_permissions_permission_id_1fbb5f2c"
    t.index ["user_id", "permission_id"], name: "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq", unique: true
    t.index ["user_id"], name: "auth_user_user_permissions_user_id_a95ead1b"
  end

  create_table "chat_chat", id: :bigint, default: nil, force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "chat_type", limit: 2, null: false
    t.timestamptz "date_created"
    t.index ["name"], name: "chat_chat_name_1316ed35_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "chat_chat_name_1316ed35_uniq", unique: true
  end

  create_table "chat_chat_members", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.integer "user_id", null: false
    t.index ["chat_id", "user_id"], name: "chat_chat_members_chat_id_user_id_47269deb_uniq", unique: true
    t.index ["chat_id"], name: "chat_chat_members_chat_id_f4937a7e"
    t.index ["user_id"], name: "chat_chat_members_user_id_44049383"
  end

  create_table "chat_message", id: :bigint, default: nil, force: :cascade do |t|
    t.text "content", null: false
    t.timestamptz "timestamp", null: false
    t.bigint "chat_id", null: false
    t.integer "author_id", null: false
    t.string "attached_file", limit: 255
    t.index ["author_id"], name: "chat_message_user_id_a47c01bb"
    t.index ["chat_id"], name: "chat_message_chat_id_21483fa7"
  end

  create_table "chat_message_read_by", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "message_id", null: false
    t.integer "user_id", null: false
    t.index ["message_id", "user_id"], name: "chat_message_read_message_id_user_id_fec92768_uniq", unique: true
    t.index ["message_id"], name: "chat_message_read_message_id_094be80d"
    t.index ["user_id"], name: "chat_message_read_user_id_0a04cf81"
  end

  create_table "deals", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_deals_on_user_id"
  end

  create_table "django_admin_log", id: :integer, default: nil, force: :cascade do |t|
    t.timestamptz "action_time", null: false
    t.text "object_id"
    t.string "object_repr", limit: 200, null: false
    t.integer "action_flag", limit: 2, null: false
    t.text "change_message", null: false
    t.integer "content_type_id"
    t.integer "user_id", null: false
    t.index ["content_type_id"], name: "django_admin_log_content_type_id_c4bce8eb"
    t.index ["user_id"], name: "django_admin_log_user_id_c564eba6"
    t.check_constraint "action_flag >= 0", name: "django_admin_log_action_flag_check"
  end

  create_table "django_content_type", id: :integer, default: nil, force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model", limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_model_76bd3d3b_uniq", unique: true
  end

  create_table "django_migrations", id: :bigint, default: nil, force: :cascade do |t|
    t.string "app", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.timestamptz "applied", null: false
  end

  create_table "django_session", primary_key: "session_key", id: { type: :string, limit: 40 }, force: :cascade do |t|
    t.text "session_data", null: false
    t.timestamptz "expire_date", null: false
    t.index ["expire_date"], name: "django_session_expire_date_a5c62663"
    t.index ["session_key"], name: "django_session_session_key_c0390e0f_like", opclass: :varchar_pattern_ops
  end

  create_table "dosti_friendrequests", id: :bigint, default: nil, force: :cascade do |t|
    t.boolean "is_active"
    t.timestamptz "time_stamp", null: false
    t.integer "reciver_id", null: false
    t.integer "sender_id", null: false
    t.index ["reciver_id"], name: "dosti_friendrequests_reciver_id_9c03ab87"
    t.index ["sender_id"], name: "dosti_friendrequests_sender_id_ccd40ea6"
  end

  create_table "dosti_friendship", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "user_id", null: false
    t.index ["user_id"], name: "dosti_friendship_user_id_key", unique: true
  end

  create_table "dosti_friendship_friends", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "friendship_id", null: false
    t.integer "user_id", null: false
    t.index ["friendship_id", "user_id"], name: "dosti_friendship_friends_friendship_id_user_id_180daf9b_uniq", unique: true
    t.index ["friendship_id"], name: "dosti_friendship_friends_friendship_id_6d50a7c2"
    t.index ["user_id"], name: "dosti_friendship_friends_user_id_e930e01d"
  end

  create_table "dosti_userprofile", id: :bigint, default: nil, force: :cascade do |t|
    t.string "profile_pic", limit: 255
    t.string "cover_photo", limit: 255
    t.string "gender", limit: 2, null: false
    t.date "date_of_birth"
    t.string "country", limit: 55, null: false
    t.string "city", limit: 55, null: false
    t.string "workplace", limit: 55, null: false
    t.string "bio", limit: 255, null: false
    t.string "marital_state", limit: 1, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "dosti_userprofile_user_id_a7b746f3"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "groups_deals", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "deal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_id"], name: "index_groups_deals_on_deal_id"
    t.index ["group_id"], name: "index_groups_deals_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm", deferrable: :deferred
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_permission_content_type_id_2f476e4b_fk_django_co", deferrable: :deferred
  add_foreign_key "auth_user_groups", "auth_group", column: "group_id", name: "auth_user_groups_group_id_97559544_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "auth_user_groups", "auth_user", column: "user_id", name: "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "auth_user_user_permissions", "auth_permission", column: "permission_id", name: "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm", deferrable: :deferred
  add_foreign_key "auth_user_user_permissions", "auth_user", column: "user_id", name: "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "chat_chat_members", "auth_user", column: "user_id", name: "chat_chat_members_user_id_44049383_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "chat_chat_members", "chat_chat", column: "chat_id", name: "chat_chat_members_chat_id_f4937a7e_fk_chat_chat_id", deferrable: :deferred
  add_foreign_key "chat_message", "auth_user", column: "author_id", name: "chat_message_author_id_923569d5_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "chat_message", "chat_chat", column: "chat_id", name: "chat_message_chat_id_21483fa7_fk_chat_chat_id", deferrable: :deferred
  add_foreign_key "chat_message_read_by", "auth_user", column: "user_id", name: "chat_message_read_user_id_0a04cf81_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "chat_message_read_by", "chat_message", column: "message_id", name: "chat_message_read_message_id_094be80d_fk_chat_message_id", deferrable: :deferred
  add_foreign_key "deals", "users"
  add_foreign_key "django_admin_log", "auth_user", column: "user_id", name: "django_admin_log_user_id_c564eba6_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "django_admin_log_content_type_id_c4bce8eb_fk_django_co", deferrable: :deferred
  add_foreign_key "dosti_friendrequests", "auth_user", column: "reciver_id", name: "dosti_friendrequests_reciver_id_9c03ab87_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "dosti_friendrequests", "auth_user", column: "sender_id", name: "dosti_friendrequests_sender_id_ccd40ea6_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "dosti_friendship", "auth_user", column: "user_id", name: "dosti_friendship_user_id_396b4ccc_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "dosti_friendship_friends", "auth_user", column: "user_id", name: "dosti_friendship_friends_user_id_e930e01d_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "dosti_friendship_friends", "dosti_friendship", column: "friendship_id", name: "dosti_friendship_fri_friendship_id_6d50a7c2_fk_dosti_fri", deferrable: :deferred
  add_foreign_key "dosti_userprofile", "auth_user", column: "user_id", name: "dosti_userprofile_user_id_a7b746f3_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "groups", "users"
  add_foreign_key "groups_deals", "deals"
  add_foreign_key "groups_deals", "groups"
end
