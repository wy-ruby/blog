# == Schema Information
#
# Table name: tags
#
#  id                     :bigint           not null, primary key
#  tag_name(文章标签名称) :string(20)       default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
FactoryBot.define do
  factory :tag do
  end
end
