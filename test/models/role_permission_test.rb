# == Schema Information
#
# Table name: role_permissions
#
#  id                                   :bigint           not null, primary key
#  created_at                           :datetime         not null
#  updated_at                           :datetime         not null
#  permissions_id(多对多关联中的权限id) :bigint
#  roles_id(多对多关联中的角色id)       :bigint
#
# Indexes
#
#  index_role_permissions_on_permissions_id  (permissions_id)
#  index_role_permissions_on_roles_id        (roles_id)
#
require 'test_helper'

class RolePermissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
