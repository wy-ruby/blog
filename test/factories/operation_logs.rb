# == Schema Information
#
# Table name: operation_logs
#
#  id                                             :bigint           not null, primary key
#  content(用户具体的操作内容)                    :string           default(""), not null
#  operation_type                                 :string
#  created_at                                     :datetime         not null
#  updated_at                                     :datetime         not null
#  operation_id(多态关联中的操作对象的id和类型。) :bigint
#  user_id(操作人)                                :bigint
#
# Indexes
#
#  index_operation_logs_on_operation_type_and_operation_id  (operation_type,operation_id)
#  index_operation_logs_on_user_id                          (user_id)
#
FactoryBot.define do
  factory :operation_log do
  end
end
