class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :tag_name, limit: 20, null: false, default: "", comment: "文章标签名称"
      t.timestamps
    end
  end
end
