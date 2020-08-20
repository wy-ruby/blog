# == Schema Information
#
# Table name: comments
#
#  id                                                                                                        :bigint           not null, primary key
#  comment(评论内容)                                                                                         :string           default(""), not null
#  discuss_type                                                                                              :string
#  ip(评论时用户的ip地址)                                                                                    :string(25)       default(""), not null
#  created_at                                                                                                :datetime         not null
#  updated_at                                                                                                :datetime         not null
#  article_id(文章id)                                                                                        :bigint           not null
#  discuss_id(生成多态关联的评论对象的id和类型(type)，目前有对文章的评论和对评论的回复这两种类型。)          :bigint
#  reply_user_id(被回复的用户的id，当被回复对象是文章时该id是文章的作者id，对象是评论时该id是被回复的用户id) :integer
#  user_id(发表评论的用户id)                                                                                 :bigint           not null
#
# Indexes
#
#  index_comments_on_article_id                   (article_id)
#  index_comments_on_discuss_type_and_discuss_id  (discuss_type,discuss_id)
#  index_comments_on_user_id                      (user_id)
#
FactoryBot.define do
  factory :comment do
  end
end
