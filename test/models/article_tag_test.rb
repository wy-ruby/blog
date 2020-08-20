# == Schema Information
#
# Table name: article_tags
#
#  id                   :bigint           not null, primary key
#  created_at(创建时间) :datetime
#  article_id(文章id)   :bigint
#  tag_id(标签id)       :bigint
#
# Indexes
#
#  index_article_tags_on_article_id  (article_id)
#  index_article_tags_on_tag_id      (tag_id)
#
require "test_helper"

class ArticleTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
