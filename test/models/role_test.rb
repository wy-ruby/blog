# == Schema Information
#
# Table name: roles
#
#  id                                        :bigint           not null, primary key
#  name(权限名称)                            :string
#  resource_type                             :string
#  created_at                                :datetime         not null
#  updated_at                                :datetime         not null
#  resource_id(多态关联，生成对象的id和类型) :bigint
#
# Indexes
#
#  index_roles_on_name_and_resource_type_and_resource_id  (name,resource_type,resource_id)
#  index_roles_on_resource_type_and_resource_id           (resource_type,resource_id)
#
require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
