class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, limit: 20, null:false ,default: "", comment: "分类名称"
      t.belongs_to :user, null:false, comment: "该分类所属的用户"
      t.timestamps
    end
  end
end
