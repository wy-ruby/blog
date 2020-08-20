# == Schema Information
#
# Table name: categories
#
#  id                        :bigint           not null, primary key
#  name(分类名称)            :string(20)       default(""), not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  user_id(该分类所属的用户) :bigint           not null
#
# Indexes
#
#  index_categories_on_user_id  (user_id)
#
FactoryBot.define do
  factory :category do
  end
end
