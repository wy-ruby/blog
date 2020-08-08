# == Schema Information
#
# Table name: secret_messages
#
#  id                                           :bigint           not null, primary key
#  content(私信内容)                            :string           not null
#  status(私信状态：0(未读)，1(已读),2(已删除)) :integer          default(0), not null
#  title(私信标题)                              :string           not null
#  created_at                                   :datetime         not null
#  updated_at                                   :datetime         not null
#  receive_id(接受者id)                         :integer          not null
#  user_id(发信人id)                            :bigint           not null
#
# Indexes
#
#  index_secret_messages_on_user_id  (user_id)
#
require 'test_helper'

class SecretMessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
