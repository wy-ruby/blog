# == Schema Information
#
# Table name: user_relations
#
#  id                       :bigint           not null, primary key
#  created_at(创建的时间)   :datetime
#  attention_id(被关注者id) :integer          not null
#  user_id(关注者id)        :bigint           not null
#
# Indexes
#
#  index_user_relations_on_user_id  (user_id)
#
FactoryBot.define do
  factory :user_relation do
  end
end
