class CreateUserRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_relations do |t|
      t.integer :attention_id, null: false, comment: "被关注者id"
      t.belongs_to :user, index: true, null: false, comment: "关注者id"
      t.timestamp :created_at, comment: "创建的时间"
    end
  end
end
