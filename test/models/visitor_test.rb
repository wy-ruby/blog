# == Schema Information
#
# Table name: visitors
#
#  id                           :bigint           not null, primary key
#  ip(访客的ip地址)             :string(25)       default(""), not null
#  created_at(来访时间)         :datetime
#  article_id(被访问的文章的id) :bigint           not null
#  user_id(被访问用户的id)      :bigint           not null
#  visitor_id(访客的id)         :integer          not null
#
# Indexes
#
#  index_visitors_on_article_id  (article_id)
#  index_visitors_on_user_id     (user_id)
#  index_visitors_on_visitor_id  (visitor_id)
#
require 'test_helper'

class VisitorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
