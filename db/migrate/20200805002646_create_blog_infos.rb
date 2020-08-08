class CreateBlogInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_infos do |t|
      t.string :name, limit: 20, null: false, default: "", comment: "用户的博客名"
      t.string :description, limit: 200, null: false, default: "", comment: "博客的描述"
      t.string :keyword, limit: 100, null: false, default: "", comment: "博客的关键字"
      t.references :user, null:false, index:true, comment: "用户id"
      t.timestamps
    end
  end
end
