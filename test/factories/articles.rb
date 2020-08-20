# == Schema Information
#
# Table name: articles
#
#  id                                                        :bigint           not null, primary key
#  article_up(是否置顶：false(否)，true(是))                 :boolean          default(FALSE), not null
#  content(文章内容)                                         :string           not null
#  ip(发布该文章的ip地址)                                    :string(25)       default(""), not null
#  qr_code(该文章的二维码链接地址)                           :string           default(""), not null
#  status(文章的状态:1(草稿)，2(已发布)，3(冻结)，4(已删除)) :integer          default(1), not null
#  style(文章的类型:0(私有)，1(公开)，2(仅关注者查看))       :integer          default(1), not null
#  title(文章的标题)                                         :string(40)       not null
#  created_at                                                :datetime         not null
#  updated_at                                                :datetime         not null
#  category_id(所属分类)                                     :bigint
#  user_id(作者id)                                           :bigint           not null
#
# Indexes
#
#  index_articles_on_category_id  (category_id)
#  index_articles_on_user_id      (user_id)
#
FactoryBot.define do
  factory :article do
  end
end
