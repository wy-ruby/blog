class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, limit: 40, null: false, comment: "文章的标题"
      t.string :content, null:false, comment: "文章内容"
      t.integer :style, limit:1, null:false, default: 1, comment: "文章的类型:0(私有)，1(公开)，2(仅关注者查看)"
      t.integer :status, limit:1, null:false, default: 1, comment: "文章的状态:1(草稿)，2(已发布)，3(冻结)，4(已删除)"
      t.boolean :article_up, null: false, default: false, comment: "是否置顶：false(否)，true(是)"
      t.string :ip, limit: 25, null: false, default: "", comment: "发布该文章的ip地址"
      t.string :qr_code,null: false, default: "", comment: "该文章的二维码链接地址"
      t.references :user, null:false, index: true, comment: "作者id"
      t.references :category, index: true, comment: "所属分类"
      t.timestamps
    end
  end
end
