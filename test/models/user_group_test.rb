# == Schema Information
#
# Table name: user_groups
#
#  id             :bigint           not null, primary key
#  name(用户组名) :string(20)       default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'test_helper'

class UserGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
