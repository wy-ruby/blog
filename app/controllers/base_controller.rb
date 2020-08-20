class BaseController < ApplicationController
  before_action :authenticate_user!
  # 在所有请求前调用该方法，用来配置i18n中的使用 URL 查询参数来设置区域。
  before_action :set_locale
  # 集中修改 URL 动态生成规则,所有依赖于 url_for 的辅助方法（例如，具名路由辅助方法 root_path 和 root_url，资源路由
  # 辅助方法 books_path 和 books_url 等等）都会自动在查询字符串中添加区域设置，例如：http://localhost:3000/?locale=zh-CN
  def self.default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = extract_locale_from_path || extract_locale_from_tld || extract_locale_from_subdomain ||
                  extract_locale_from_header || current_user.try(:locale) || I18n.default_locale
  end

  # 从请求路径的参数中获取区域设置，如果获取失败会返回nil
  def extract_locale_from_path
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  # 从顶级域名中获取区域设置，如果获取失败会返回 nil
  # 需要在 /etc/hosts 文件中添加如下设置,即配置host映射的域名，从访问的域名中获取用户所用的语言：
  #   127.0.0.1 application.com
  #   127.0.0.1 application.it
  #   127.0.0.1 application.pl
  def extract_locale_from_tld
    parsed_locale = request.host.split(".").last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  # 从子域名中获取区域设置（例如 http://it.application.local:3000）
  # 需要在 /etc/hosts 文件中添加如下设置：
  #   127.0.0.1 it.application.local，根据分解子域名的名字来获取用户所用的语言。
  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  # 如果没有显式地为请求设置区域（例如，通过上面提到的各种方式），应用就会尝试推断出所需区域。
  # Accept-Language HTTP 首部指明响应请求时使用的首选语言。浏览器根据用户的语言偏好设置
  # 设定这个 HTTP 首部，这是推断区域设置的首选方案。
  def extract_locale_from_header
    # request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    # 这里建议使用Rack Locale中间件去实现，这样才能相对更加精准。
    # 参考：https://github.com/rack/rack-contrib/blob/master/lib/rack/contrib/locale.rb
  end
end
