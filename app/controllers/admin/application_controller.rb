class Admin::ApplicationController < ApplicationController
  layout "admin"
  # 任何操作前都需要先登录
  before_action :authenticate_admin!
  # 获取设置的语言
  before_action :set_locale

  def set_locale
    current_user.try(:locale) || I18n.default_locale
  end
end
