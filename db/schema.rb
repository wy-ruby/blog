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

ActiveRecord::Schema.define(version: 2020_08_10_113410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"

  create_table "article_tags", force: :cascade do |t|
    t.bigint "article_id", comment: "文章id"
    t.bigint "tag_id", comment: "标签id"
    t.datetime "created_at", comment: "创建时间"
    t.index ["article_id"], name: "index_article_tags_on_article_id"
    t.index ["tag_id"], name: "index_article_tags_on_tag_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title", limit: 40, null: false, comment: "文章的标题"
    t.string "content", null: false, comment: "文章内容"
    t.integer "style", limit: 2, default: 1, null: false, comment: "文章的类型:0(私有)，1(公开)，2(仅关注者查看)"
    t.integer "status", limit: 2, default: 1, null: false, comment: "文章的状态:1(草稿)，2(已发布)，3(冻结)，4(已删除)"
    t.boolean "article_up", default: false, null: false, comment: "是否置顶：false(否)，true(是)"
    t.string "ip", limit: 25, default: "", null: false, comment: "发布该文章的ip地址"
    t.string "qr_code", default: "", null: false, comment: "该文章的二维码链接地址"
    t.bigint "user_id", null: false, comment: "作者id"
    t.bigint "category_id", comment: "所属分类"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "blog_infos", force: :cascade do |t|
    t.string "name", limit: 20, default: "", null: false, comment: "用户的博客名"
    t.string "description", limit: 200, default: "", null: false, comment: "博客的描述"
    t.string "keyword", limit: 100, default: "", null: false, comment: "博客的关键字"
    t.bigint "user_id", null: false, comment: "用户id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blog_infos_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 20, default: "", null: false, comment: "分类名称"
    t.bigint "user_id", null: false, comment: "该分类所属的用户"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content", default: "", null: false, comment: "评论内容"
    t.string "discuss_type"
    t.bigint "discuss_id", comment: "生成多态关联的评论对象的id和类型(type)，目前有对文章的评论和对评论的回复这两种类型。"
    t.string "ip", limit: 25, default: "", null: false, comment: "评论时用户的ip地址"
    t.integer "reply_user_id", comment: "被回复的用户的id，当被回复对象是文章时该id是文章的作者id，对象是评论时该id是被回复的用户id"
    t.bigint "article_id", null: false, comment: "文章id"
    t.bigint "user_id", null: false, comment: "发表评论的用户id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["discuss_type", "discuss_id"], name: "index_comments_on_discuss_type_and_discuss_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "operation_logs", force: :cascade do |t|
    t.string "operation_type"
    t.bigint "operation_id", comment: "多态关联中的操作对象的id和类型。"
    t.string "content", default: "", null: false, comment: "用户具体的操作内容"
    t.bigint "user_id", comment: "操作人"
    t.string "url", limit: 300, default: "", null: false, comment: "操作的执行URL"
    t.integer "speed_time", comment: "消耗时间,单位毫秒(ms)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operation_type", "operation_id"], name: "index_operation_logs_on_operation_type_and_operation_id"
    t.index ["user_id"], name: "index_operation_logs_on_user_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name", limit: 20, default: "", null: false, comment: "权限名称"
    t.bigint "parent_id", comment: "自连接中的父级id，代表父级权限的id"
    t.string "url", limit: 300, default: "", null: false, comment: "权限的url"
    t.integer "create_by", null: false, comment: "该权限的创建人"
    t.string "icon", default: "", null: false, comment: "权限图标"
    t.integer "permission_value", limit: 2, default: 0, null: false, comment: "该权限的权重，0最小255最大"
    t.integer "status", limit: 2, default: 1, null: false, comment: "该权限的状态:0(禁用),1(正常)"
    t.integer "sort", limit: 2, comment: "排序"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_permissions_on_parent_id"
  end

  create_table "pghero_query_stats", force: :cascade do |t|
    t.string "database", default: "", null: false, comment: "pghero的配置项中的配置的数据库名字"
    t.string "user", default: "", null: false, comment: "连接数据库的用户名"
    t.text "query", default: "", null: false, comment: "查询语句"
    t.bigint "query_hash", comment: "查询的哈希值"
    t.float "total_time", comment: "查询使用的时间"
    t.bigint "calls"
    t.datetime "captured_at", comment: "捕获时间"
    t.index ["database", "captured_at"], name: "index_pghero_query_stats_on_database_and_captured_at"
  end

  create_table "role_permissions", force: :cascade do |t|
    t.bigint "role_id", comment: "多对多关联中的角色id"
    t.bigint "permission_id", comment: "多对多关联中的权限id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", limit: 20, default: "", null: false, comment: "角色名称"
    t.string "description", limit: 100, default: "", null: false, comment: "对该角色的描述"
    t.integer "status", limit: 2, default: 1, null: false, comment: "角色的状态:0(不可用),1(可用)"
    t.integer "sort", limit: 2, comment: "排序"
    t.integer "is_default", limit: 2, default: 0, null: false, comment: "是否默认角色:0(否),1(是)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "secret_messages", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "发信人id"
    t.integer "receive_id", null: false, comment: "接受者id"
    t.string "title", null: false, comment: "私信标题"
    t.string "content", null: false, comment: "私信内容"
    t.integer "status", limit: 2, default: 0, null: false, comment: "私信状态：0(未读)，1(已读),2(已删除)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_secret_messages_on_user_id"
  end

  create_table "system_messages", force: :cascade do |t|
    t.bigint "role_id", comment: "如果消息类型是角色的话，需要添加上这个角色id"
    t.bigint "user_id", comment: "某个接受者的用户id"
    t.integer "message_type", limit: 2, default: 1, null: false, comment: "系统消息的类型：1(所有用户), 2(单个用户)，3(某个角色的用户)"
    t.string "topic", limit: 50, default: "", null: false, comment: "系统消息的标题"
    t.string "content", default: "", null: false, comment: "系统消息的内容"
    t.integer "status", limit: 2, default: 1, null: false, comment: "消息状态：1(未读)，2(已读)"
    t.datetime "created_at", comment: "创建时间"
    t.index ["role_id"], name: "index_system_messages_on_role_id"
    t.index ["user_id"], name: "index_system_messages_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name", limit: 20, default: "", null: false, comment: "文章标签名称"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_relations", force: :cascade do |t|
    t.integer "attention_id", null: false, comment: "被关注者id"
    t.bigint "user_id", null: false, comment: "关注者id"
    t.datetime "created_at", comment: "创建的时间"
    t.index ["user_id"], name: "index_user_relations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", comment: "用户名"
    t.string "phone", limit: 11, comment: "用户手机号"
    t.integer "sex", limit: 2, comment: "用户性别: 1(男)，2(女)"
    t.string "address", limit: 100, default: "", null: false, comment: "用户所在地"
    t.string "description", default: "", null: false, comment: "用户的自我描述"
    t.string "head_image_url", default: "", null: false, comment: "用户的头像路径"
    t.string "wechat_image_url", default: "", null: false, comment: "用户的微信二维码"
    t.string "school", limit: 100, default: "", null: false, comment: "用户的学校"
    t.integer "birthday", comment: "用户的生日"
    t.string "weibo", limit: 50, default: "", null: false, comment: "用户的微博"
    t.string "local", limit: 10, default: "zh-CN", null: false, comment: "用户的语言偏好设置"
    t.boolean "status", default: true, null: false, comment: "用户账户状态: false(冻结), true(正常)"
    t.datetime "last_update_time", comment: "用户上次更新博客时间"
    t.string "provider", comment: "三方登录提供商"
    t.string "uid", comment: "授权用户的uid"
    t.string "image", comment: "授权用户的头像地址"
    t.string "encrypted_password", default: "", null: false, comment: "加密密码"
    t.string "email", default: "", null: false, comment: "邮箱"
    t.string "reset_password_token", comment: "重置密码token"
    t.datetime "reset_password_sent_at", comment: "重置密码发送时间"
    t.integer "sign_in_count", default: 0, null: false, comment: "登陆次数"
    t.datetime "current_sign_in_at", comment: "本次登陆时间"
    t.datetime "last_sign_in_at", comment: "上次登陆时间"
    t.string "current_sign_in_ip", comment: "本次登陆ip地址"
    t.string "last_sign_in_ip", limit: 25, comment: "上次登陆ip地址"
    t.string "confirmation_token", comment: "确认时的token信息"
    t.datetime "confirmed_at", comment: "确认时间"
    t.datetime "confirmation_sent_at", comment: "确认信息发送时间"
    t.string "unconfirmed_email", comment: "未点击确定的邮箱"
    t.integer "failed_attempts", default: 0, null: false, comment: "失败次数"
    t.string "unlock_token", comment: "解锁token"
    t.datetime "locked_at", comment: "锁定时间"
    t.datetime "remember_created_at", comment: "用户创建时间"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id", comment: "多对多关联中的用户的id"
    t.bigint "role_id", comment: "多对多关联中的角色的id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "visitors", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "被访问用户的id"
    t.bigint "article_id", null: false, comment: "被访问的文章的id"
    t.string "ip", limit: 25, default: "", null: false, comment: "访客的ip地址"
    t.integer "visitor_id", null: false, comment: "访客的id"
    t.datetime "created_at", comment: "来访时间"
    t.index ["article_id"], name: "index_visitors_on_article_id"
    t.index ["user_id"], name: "index_visitors_on_user_id"
    t.index ["visitor_id"], name: "index_visitors_on_visitor_id"
  end

end
