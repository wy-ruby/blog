# == Schema Information
#
# Table name: system_messages
#
#  id                                                                :bigint           not null, primary key
#  content(系统消息的内容)                                           :string           default(""), not null
#  message_type(系统消息的类型：1(代表所有用户), 2(用户)，3(用户组)) :integer          default(1), not null
#  status(消息状态：1(未读)，2(已读))                                :integer          default(1), not null
#  topic(系统消息的标题)                                             :string(50)       default(""), not null
#  created_at(创建时间)                                              :datetime
#  user_group_id(用户组id)                                           :bigint
#  user_id(某个接受者的用户id)                                       :bigint
#
# Indexes
#
#  index_system_messages_on_user_group_id  (user_group_id)
#  index_system_messages_on_user_id        (user_id)
#
require 'test_helper'

class SystemMessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
