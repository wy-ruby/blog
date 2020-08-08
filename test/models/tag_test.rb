# == Schema Information
#
# Table name: tags
#
#  id                     :bigint           not null, primary key
#  tag_name(文章标签名称) :string(20)       default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
