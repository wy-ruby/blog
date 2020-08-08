class CreateOperationLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :operation_logs do |t|
      t.references :operation, polymorphic:true, comment: "多态关联中的操作对象的id和类型。"
      t.string :content, null:false, default: "", comment:"用户具体的操作内容"
      t.references :user, comment: "操作人"
      t.timestamps
    end
  end
end
