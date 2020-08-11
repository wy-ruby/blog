class CreateSystemMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :system_messages do |t|
      t.references :role, comment: "如果消息类型是角色的话，需要添加上这个角色id"
      t.belongs_to :user, comment: "某个接受者的用户id"
      t.integer :message_type, limit:1, null:false, default: 1, comment: "系统消息的类型：1(所有用户), 2(单个用户)，3(某个角色的用户)"
      t.string :topic, limit:50, null:false, default: "", comment: "系统消息的标题"
      t.string :content, null:false, default: "", comment: "系统消息的内容"
      t.integer :status, limit:1, null:false, default: 1, comment: "消息状态：1(未读)，2(已读)"
      t.timestamp :created_at, comment: "创建时间"
    end
  end
end
