class CreateVisitors < ActiveRecord::Migration[5.2]
  def change
    create_table :visitors do |t|
      t.references :user, index:true, null:false, comment: "被访问用户的id"
      t.references :article, null:false, comment: "被访问的文章的id"
      t.string :ip, limit: 25, null:false, default: "", comment: "访客的ip地址"
      t.integer :visitor_id, null:false, index:true, comment: "访客的id"
      t.timestamp :created_at, comment: "来访时间"
    end
  end
end
