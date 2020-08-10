class CreateRolePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :role_permissions do |t|
      t.references :roles, comment: "多对多关联中的角色id"
      t.references :permissions, comment: "多对多关联中的权限id"
      t.timestamps
    end
  end
end
