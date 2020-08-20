class CreatePgheroQueryStats < ActiveRecord::Migration[5.2]
  def change
    create_table :pghero_query_stats do |t|
      t.string :database, null: false, default: "", comment: "pghero的配置项中的配置的数据库名字"
      t.string :user, null: false, default: "", comment: "连接数据库的用户名"
      t.text :query, null: false, default: "", comment: "查询语句"
      t.integer :query_hash, limit: 8, comment: "查询的哈希值"
      t.float :total_time, comment: "查询使用的时间"
      t.integer :calls, limit: 8
      t.timestamp :captured_at, comment: "捕获时间"
    end

    add_index :pghero_query_stats, [:database, :captured_at]
  end
end
