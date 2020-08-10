class RolifyCreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table(:roles) do |t|
      t.string :name, limit: 20, null:false, default:"", comment: "角色名称"
      t.string :description, limit: 100, null:false, default:"", comment: "对该角色的描述"
      t.integer :status, limit:1, null: false, default: 1, comment: "角色的状态:0(不可用),1(可用)"
      t.integer :sort, limit:1, uniq:true, comment: "排序"
      t.integer :is_default, limit:1, null: false, default: 0, comment: "是否默认角色:0(否),1(是)"
      t.timestamps
    end

    create_table(:users_roles, :id => false) do |t|
      t.references :user, comment: "多对多关联中的用户的id"
      t.references :role, comment: "多对多关联中的角色的id"
    end

    add_index(:users_roles, [ :user_id, :role_id ])
  end
end
