# == Schema Information
#
# Table name: users
#
#  id                                            :bigint           not null, primary key
#  address(用户所在地)                           :string(100)      default(""), not null
#  birthday(用户的生日)                          :integer
#  description(用户的自我描述)                   :string           default(""), not null
#  head_image_url(用户的头像路径)                :string           default(""), not null
#  image(授权用户的头像地址)                     :string
#  last_update_time(用户上次更新博客时间)        :datetime
#  name(用户名)                                  :string
#  phone(用户手机号)                             :string(11)
#  provider(三方登录提供商)                      :string
#  school(用户的学校)                            :string(100)      default(""), not null
#  sex(用户性别: 1(男)，2(女))                   :integer
#  status(用户账户状态: false(冻结), true(正常)) :boolean          default(TRUE), not null
#  uid(授权用户的uid)                            :string
#  wechat_image_url(用户的微信二维码)            :string           default(""), not null
#  weibo(用户的微博)                             :string(50)       default(""), not null
#  user_group_id(所属用户组)                     :bigint
#
# Indexes
#
#  index_users_on_user_group_id  (user_group_id)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
