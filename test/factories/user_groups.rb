# == Schema Information
#
# Table name: user_groups
#
#  id             :bigint           not null, primary key
#  name(用户组名) :string(20)       default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :user_group do
    
  end
end
