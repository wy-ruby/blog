class ApplicationController < ActionController::Base
  # 在应用程序控制器中包含Pundit
  include Pundit
  # 这个会跟踪您是否在控制器操作的任何位置调用了authorize，如果没有调用会报错。
  # after_action :verify_authorized, except: :index
  # 这个会跟踪你是否在控制器中调用policy_scope, 如果没有调用会报错。
  # after_action :verify_policy_scoped, only: :index
  # Pundit引发一个Pundit :: NotAuthorizedError的时候，可以自定义一个方法去处理，
  # 这里是定义了user_not_authorized方法，这个方法在application_controller.rb中
  # 的时候是针对全局的，可以在每个控制器去重写控制。
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # 如果你的控制器可能无权访问current_user（一般是当前登录的用户的信息，例如devise就是
  # 用该方法代表当前用户的信息），或者你的current_user不是Pundit应该调用的方法（例如
  # 是current_admin）。可以在你的控制器中自定义pundit_user方法去定义当前用户的信息。
  def pundit_user
    current_user
  end

  # 开启csrf(跨站请求伪造)安全防护。请记住，GET和HEAD请求不会被检查。
  protect_from_forgery with: :exception

  # 定义lograge日志中要额外添加保存的信息，信息放在 event.payload 的哈希中，可以在 config/environments/* 配置中添加的 custom_options 选项获取。
  def append_info_to_payload(payload)
    super
    payload[:host] = request.host
  end

  # 处理不存在的路由信息。
  def route_not_found
    render file: "public/404", status: 404
  end

  private

  # 自定义pundit的全局用户无权限操作的时候的处理方法
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  # devise 配置的登录后跳转到的页面
  def after_sign_in_path_for(resource)
    # 自动解析resource资源类型，然后跳转到对应的目录
    binding.pry
    stored_location_for(resource) || get_after_sign_in_path(resource)
  end

  # 如果使用  stored_location_for 方法获取不到登录后跳转的地址，那么就用该方法解析出对应的地址。
  def get_after_sign_in_path(resource)
    if resource.class.name == "User"
      edit_user_registration_path
    elsif resource.class.name == "Admin"
      edit_admin_registration_path
    else
      not_found_path
    end
  end

  # devise的退出登录后的页面
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      unauthenticated_root_path
    elsif resource_or_scope == :admin
      admin_root_path
    else
      not_found_path
    end
  end
end
