# lograge 这个gem的配置信息。实际上应该是在config/environments下的对应环境中配置，这里是为了方便。
Rails.application.configure do
  # 授权使用该日志收集器。
  config.lograge.enabled = true
  # 如果在应用程序中使用多个基本控制器类，设置一个包含它们的数组：
  config.lograge.base_controller_class = %w[ActionController::Base ActionController::API]

  # 可以添加一个钩子以直接访问控制器方法（例如request和current_user）。
  config.lograge.custom_payload do |controller|
    {
        host: controller.request.host,
        user_id: controller.current_user.try(:id)
    }
  end

  # custom_options可以是lambda或哈希,如果是lambda，则必须返回哈希
  config.lograge.custom_options = lambda do |event|
    # capture some specific timing values you are interested in
    {
        time: Time.now.strftime("%Y-%m-%d %H:%M:%S"),
    }
  end

  # 保留rails原有的日志
  config.lograge.keep_original_rails_log = true
  config.lograge.logger = ActiveSupport::Logger.new "#{Rails.root}/log/lograge_#{Rails.env}.log"

  # 为了进一步清理日志，您还可以告诉Lograge跳过满足给定条件的日志消息。您可以跳过某些控制器操作生成的日志消息，也可以编写自定义处理程序以根据
  # 日志事件中的数据跳过消息：
  # config.lograge.ignore_actions = ['HomeController#index', 'AController#an_action']
  # config.lograge.ignore_custom = lambda do |event|
  #   return true here if you want to ignore based on the event
  # end

  # lograge支持多种类型的日志
  # config.lograge.formatter = Lograge::Formatters::Logstash.new
  # 下面都是支持的日志类型
  # Lograge::Formatters::Lines.new
  # Lograge::Formatters::Cee.new
  # Lograge::Formatters::Graylog2.new
  # Lograge::Formatters::KeyValue.new  # default lograge format
  # Lograge::Formatters::Json.new
  # Lograge::Formatters::Logstash.new
  # Lograge::Formatters::LTSV.new
  # Lograge::Formatters::Raw.new       # Returns a ruby hash object
  # 除了格式化程序，您还可以通过传递一个响应#call的对象来自己操作数据：
  # config.lograge.formatter = ->(data) { "Called #{data[:controller]}" } # data is a ruby hash
end