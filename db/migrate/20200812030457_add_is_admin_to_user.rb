class AddIsAdminToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_admin, :boolean, after: :sex, null:false, default: false, comment: "该用户是否为管理员"
  end
end
