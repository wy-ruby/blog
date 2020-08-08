# == Schema Information
#
# Table name: users
#
#  id                                            :bigint           not null, primary key
#  address(用户所在地)                           :string(100)      default(""), not null
#  birthday(用户的生日)                          :integer
#  confirmation_sent_at(确认信息发送时间)        :datetime
#  confirmation_token(确认时的token信息)         :string
#  confirmed_at(确认时间)                        :datetime
#  current_sign_in_at(本次登陆时间)              :datetime
#  current_sign_in_ip(本次登陆ip地址)            :string
#  description(用户的自我描述)                   :string           default(""), not null
#  email(邮箱)                                   :string           default(""), not null
#  encrypted_password(加密密码)                  :string           default(""), not null
#  failed_attempts(失败次数)                     :integer          default(0), not null
#  head_image_url(用户的头像路径)                :string           default(""), not null
#  image(授权用户的头像地址)                     :string
#  last_sign_in_at(上次登陆时间)                 :datetime
#  last_sign_in_ip(上次登陆ip地址)               :string(25)
#  last_update_time(用户上次更新博客时间)        :datetime
#  locked_at(锁定时间)                           :datetime
#  name(用户名)                                  :string
#  phone(用户手机号)                             :string(11)
#  provider(三方登录提供商)                      :string
#  remember_created_at(用户创建时间)             :datetime
#  reset_password_sent_at(重置密码发送时间)      :datetime
#  reset_password_token(重置密码token)           :string
#  school(用户的学校)                            :string(100)      default(""), not null
#  sex(用户性别: 1(男)，2(女))                   :integer
#  sign_in_count(登陆次数)                       :integer          default(0), not null
#  slug                                          :string
#  status(用户账户状态: false(冻结), true(正常)) :boolean          default(TRUE), not null
#  uid(授权用户的uid)                            :string
#  unconfirmed_email(未点击确定的邮箱)           :string
#  unlock_token(解锁token)                       :string
#  wechat_image_url(用户的微信二维码)            :string           default(""), not null
#  weibo(用户的微博)                             :string(50)       default(""), not null
#  created_at                                    :datetime         not null
#  updated_at                                    :datetime         not null
#  user_group_id(所属用户组)                     :bigint
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#  index_users_on_user_group_id         (user_group_id)
#

FactoryBot.define do
  factory :user do
    
  end
end
