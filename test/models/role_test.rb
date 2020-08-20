# == Schema Information
#
# Table name: roles
#
#  id                                   :bigint           not null, primary key
#  description(对该角色的描述)          :string(100)      default(""), not null
#  is_default(是否默认角色:0(否),1(是)) :integer          default(0), not null
#  name(角色名称)                       :string(20)       default(""), not null
#  sort(排序)                           :integer
#  status(角色的状态:0(不可用),1(可用)) :integer          default(1), not null
#  created_at                           :datetime         not null
#  updated_at                           :datetime         not null
#
require "test_helper"

class RoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
