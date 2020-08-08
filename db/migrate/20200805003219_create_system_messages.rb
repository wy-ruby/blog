class CreateSystemMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :system_messages do |t|
      t.references :user_group, comment: "用户组id"
      t.belongs_to :user, comment: "某个接受者的用户id"
      t.integer :message_type, limit:1, null:false, default: 1, comment: "系统消息的类型：1(代表所有用户), 2(用户)，3(用户组)"
      t.string :topic, limit:50, null:false, default: "", comment: "系统消息的标题"
      t.string :content, null:false, default: "", comment: "系统消息的内容"
      t.integer :status, limit:1, null:false, default: 1, comment: "消息状态：1(未读)，2(已读)"
      t.timestamp :created_at, comment: "创建时间"
    end
  end
end
