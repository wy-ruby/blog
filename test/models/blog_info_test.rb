# == Schema Information
#
# Table name: blog_infos
#
#  id                      :bigint           not null, primary key
#  description(博客的描述) :string(200)      default(""), not null
#  keyword(博客的关键字)   :string(100)      default(""), not null
#  name(用户的博客名)      :string(20)       default(""), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  user_id(用户id)         :bigint           not null
#
# Indexes
#
#  index_blog_infos_on_user_id  (user_id)
#
require 'test_helper'

class BlogInfoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
