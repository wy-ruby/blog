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
require 'rails_helper'

RSpec.describe Category, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
