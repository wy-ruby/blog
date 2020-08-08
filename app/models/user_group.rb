# == Schema Information
#
# Table name: user_groups
#
#  id             :bigint           not null, primary key
#  name(用户组名) :string(20)       default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class UserGroup < ApplicationRecord
  # 插入 rolify 的相关配置，里面包含有 has_and_belongs_to_many :roles
  rolify
  has_many :users

end
