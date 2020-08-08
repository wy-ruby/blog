class CreateArticleTags < ActiveRecord::Migration[5.2]
  def change
    create_table :article_tags do |t|
      t.references :article, index: true, comment: "文章id"
      t.references :tag, index: true, comment: "标签id"
      t.timestamp :created_at, comment: "创建时间"
    end
  end
end
