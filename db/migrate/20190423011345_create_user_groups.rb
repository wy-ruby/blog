class CreateUserGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :user_groups do |t|
      t.string :name, limit: 20, null:false, default:"", comment:"用户组名"
      t.timestamps
    end
  end
end
