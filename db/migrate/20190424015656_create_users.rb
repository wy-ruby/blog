class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, comment: "用户名"
      t.string :phone, limit: 11, unique: true, comment: "用户手机号"
      t.integer :sex, limit: 1, comment: "用户性别: 1(男)，2(女)"
      t.string :address, limit: 100, null: false, default: "", comment: "用户所在地"
      t.string :description, null: false, default: "", comment: "用户的自我描述"
      t.string :head_image_url, null: false, default: "", comment: "用户的头像路径"
      t.string :wechat_image_url, null: false, default: "", comment: "用户的微信二维码"
      t.string :school, limit: 100, null: false, default: "", comment: "用户的学校"
      t.integer :birthday, comment: "用户的生日"
      t.string :weibo, limit: 50, null: false, default: "", comment: "用户的微博"
      t.string :local, limit: 10, null: false, default: "zh-CN", comment: "用户的语言偏好设置"
      t.boolean :status, null: false, default: true, comment: "用户账户状态: false(冻结), true(正常)"
      t.timestamp :last_update_time, comment: "用户上次更新博客时间"
    end
  end
end
