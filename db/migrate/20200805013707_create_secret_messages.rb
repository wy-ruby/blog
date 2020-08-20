class CreateSecretMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :secret_messages do |t|
      t.references :user, index: true, null: false, comment: "发信人id"
      t.integer :receive_id, null: false, comment: "接受者id"
      t.string :title, null: false, comment: "私信标题"
      t.string :content, null: false, comment: "私信内容"
      t.integer :status, limit: 1, null: false, default: 0, comment: "私信状态：0(未读)，1(已读),2(已删除)"
      t.timestamps
    end
  end
end
