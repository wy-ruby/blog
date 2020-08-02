class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, comment: "用户名"
      t.string :password_digest, comment: '密码'

      t.timestamps
    end
  end
end
