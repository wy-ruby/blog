class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content, null: false, default: "", comment: "评论内容"
      t.references :discuss, polymorphic: true, index: true,
                             comment: "生成多态关联的评论对象的id和类型(type)，目前有对文章的评论和对评论的回复这两种类型。"
      t.string :ip, limit: 25, null: false, default: "", comment: "评论时用户的ip地址"
      t.integer :reply_user_id, comment: "被回复的用户的id，当被回复对象是文章时该id是文章的作者id，对象是评论时该id是被回复的用户id"
      t.belongs_to :article, null: false, index: true, comment: "文章id"
      t.references :user, null: false, index: true, comment: "发表评论的用户id"
      t.timestamps
    end
  end
end
