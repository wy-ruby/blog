class RolifyCreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table(:roles) do |t|
      t.string :name, comment: "权限名称"
      t.references :resource, :polymorphic => true, comment:"多态关联，生成对象的id和类型"

      t.timestamps
    end

    create_table(:user_groups_roles, :id => false) do |t|
      t.references :user_group, comment: "用户组id"
      t.references :role, comment: "权限id"
    end
    
    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:user_groups_roles, [ :user_group_id, :role_id ])
  end
end
