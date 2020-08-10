class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :name, limit: 20, null:false, default: "", comment:"权限名称"
      t.references :parent, comment: "自连接中的父级id，代表父级权限的id"
      t.string :url, limit: 300, null:false, default: "", comment: "权限的url"
      t.integer :create_by, null:false, comment: "该权限的创建人"
      t.string :icon, null:false, default:"", comment: "权限图标"
      t.integer :permission_value, limit:2, null:false, default:0, comment: "该权限的权重，0最小255最大"
      t.integer :status, limit: 1, null:false, default: 1, comment: "该权限的状态:0(禁用),1(正常)"
      t.integer :sort, limit: 1, comment: "排序"
      t.timestamps
    end

  end
end
