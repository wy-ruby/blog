# == Schema Information
#
# Table name: permissions
#
#  id                                            :bigint           not null, primary key
#  create_by(该权限的创建人)                     :integer          not null
#  icon(权限图标)                                :string           default(""), not null
#  name(权限名称)                                :string(20)       default(""), not null
#  permission_value(该权限的权重，0最小255最大)  :integer          default(0), not null
#  sort(排序)                                    :integer
#  status(该权限的状态:0(禁用),1(正常))          :integer          default(1), not null
#  url(权限的url)                                :string(300)      default(""), not null
#  created_at                                    :datetime         not null
#  updated_at                                    :datetime         not null
#  parent_id(自连接中的父级id，代表父级权限的id) :bigint
#
# Indexes
#
#  index_permissions_on_parent_id  (parent_id)
#
class Permission < ApplicationRecord
  has_many :roles, through: :role_permissions
  belongs_to :parent, class_name: "Permission"
  has_many :subordinates, class_name: "Permission", foreign_key: "parent_id"
end
