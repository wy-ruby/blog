# == Schema Information
#
# Table name: system_messages
#
#  id                                                                        :bigint           not null, primary key
#  content(系统消息的内容)                                                   :string           default(""), not null
#  message_type(系统消息的类型：1(所有用户), 2(单个用户)，3(某个角色的用户)) :integer          default(1), not null
#  status(消息状态：1(未读)，2(已读))                                        :integer          default(1), not null
#  topic(系统消息的标题)                                                     :string(50)       default(""), not null
#  created_at(创建时间)                                                      :datetime
#  role_id(如果消息类型是角色的话，需要添加上这个角色id)                     :bigint
#  user_id(某个接受者的用户id)                                               :bigint
#
# Indexes
#
#  index_system_messages_on_role_id  (role_id)
#  index_system_messages_on_user_id  (user_id)
#
FactoryBot.define do
  factory :system_message do
    
  end
end
