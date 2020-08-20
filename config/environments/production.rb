Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Ensures that a master key has been made available in either ENV["RAILS_MASTER_KEY"]
  # or in config/master.key. This key is used to decrypt credentials (and other encrypted files).
  config.require_master_key = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.true
  # 如果是设置了nginx处理静态文件的话，这个地方就设置false即可。
  # config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.public_file_server.enabled = false

  # 让Rails伺服静态资源文件。默认值为true，但在生产环境中为false，因为应该使用服务器软件（例如 Nginx 或 Apache）伺服静态资源文件。如果测试
  # 程序，或者在生产环境中使用WEBrick(极力不推荐),应该设为true，否则无法使用页面缓存，请求public文件夹中的文件时也会经由Rails处理。
  # config.serve_static_assets = true

  # Compress JavaScripts and CSS.设置静态资源的压缩方式,下面那种的支持es6语法的解析
  # config.assets.js_compressor = :uglifier
  config.assets.js_compressor = Uglifier.new(harmony: true)
  # 如果 Gemfile 中有 sass-rails，就会自动用来压缩 CSS，无需设置 config.assets.css_compressor 选项。
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.用于在生产环境中启用 Sprockets 实时编译功能。
  config.assets.compile = false

  # 是否压缩编译后的静态资源文件
  config.assets.compress = true

  # 在静态资源文件名中加入 MD5 指纹。
  config.assets.digest = true

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'

  # X-Sendfile 报头的作用是让服务器忽略程序的响应，直接从硬盘上伺服指定的文件。默认情况下服务器不会发送这个报头，但在支持该
  # 报头的服务器上可以启用。启用后，会跳过响应直接由服务器伺服文件，速度更快。
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  config.action_dispatch.x_sendfile_header = "X-Accel-Redirect" # for NGINX

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Mount Action Cable outside main process or domain
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http:\/\/example.*/ ]

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [:request_id]

  # Use a different cache store in production.
  # 配置缓存的存储位置为redis,redis服务器总共可以设置16个数据库，如果没有设置默认是0
  config.cache_store = :redis_cache_store, CACHE_REDIS_CONFIG.merge({ namespace: "cache", compress: true })

  # 配置http缓存
  redis_password = CACHE_REDIS_CONFIG[:password].present? ? ":#{CACHE_REDIS_CONFIG[:password]}@" : ""
  metastore_redis_config = "redis://#{redis_password}#{CACHE_REDIS_CONFIG[:host]}:#{CACHE_REDIS_CONFIG[:port]}/#{CACHE_REDIS_CONFIG[:db]}/metastore"
  entitystore_redis_config = "redis://#{redis_password}#{CACHE_REDIS_CONFIG[:host]}:#{CACHE_REDIS_CONFIG[:port]}/#{CACHE_REDIS_CONFIG[:db]}/entitystore"
  config.action_dispatch.rack_cache = {
    metastore: metastore_redis_config,
    entitystore: entitystore_redis_config
  }

  # Use a real queuing backend for Active Job (and separate queues per environment)
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "blog_#{Rails.env}"

  config.action_mailer.perform_caching = false

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # 设置一个全局字符串，作为数据表名的前缀。
  # config.active_record.table_name_prefix = rgt_

  # Use a different logger for distributed setups.
  # require 'syslog/logger'
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # 配置email
  # 设置项说明
  # logger	运行邮件程序时生成日志信息。设为 nil 禁用日志。可设为 Ruby 自带的 Logger 或 Log4r 库。
  # smtp_settings	设置 :smtp 发送方式的详情。
  # sendmail_settings	设置 :sendmail 发送方式的详情。
  # raise_delivery_errors	如果邮件发送失败，是否抛出异常。仅当外部邮件服务器设置为立即发送才有效。
  # delivery_method	设置发送方式，可设为 :smtp（默认）、:sendmail、:file 和  :test。详情参阅 API 文档。
  # perform_deliveries	调用 deliver 方法时是否真发送邮件。默认情况下会真的发送，但在功能测试中可以不发送。
  # deliveries	把通过 Action Mailer 使用 :test 方式发送的邮件保存到一个数组中，协助单元测试和功能测试。
  # default_options	为 mail 方法设置默认选项值（:from，:reply_to 等）。

  config.action_mailer.delivery_method = :sendmail
  # Defaults to:
  # config.action_mailer.sendmail_settings = {
  #   location: '/usr/sbin/sendmail',
  #   arguments: '-i -t'
  # }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_options = { from: Rails.application.credentials[:email_user] }

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: "smtp.163.com",
    port: 25,
    domain: "smtp.163.com",
    user_name: Rails.application.credentials[:email_user],
    password: Rails.application.credentials[:email_pass],
    authentication: "login",
    enable_starttls_auto: true
  }

  # 配置 lograge 的支持。一般是在生产环境下配置的。
  config.lograge.enabled = true
  # 可以添加自定义内容。
  config.lograge.custom_options = lambda do |event|
    { time: Time.now.strftime("%Y-%m-%d %H:%M:%S"), host: event.payload[:host] }
  end
  # 可以添加一个钩子以直接访问控制器方法（例如request和current_user）该哈希将自动合并到日志数据中。
  config.lograge.custom_payload do |controller|
    {
      protocol: controller.request.protocol.match(/([a-zA-Z]*)/)[0].to_s
    }
  end
  # 保持rails原本的日志信息
  # config.lograge.keep_original_rails_log = true
  # config.lograge.logger = ActiveSupport::Logger.new "#{Rails.root}/log/lograge_#{Rails.env}.log"

  # 为了进一步清理日志，您还可以告诉Lograge跳过满足给定条件的日志消息。您可以跳过某些控制器操作生成的日志消息，也可以编写自定义处理程序以根据
  # 日志事件中的数据跳过消息：
  # config.lograge.ignore_actions = ['HomeController#index', 'AController#an_action']
  # config.lograge.ignore_custom = lambda do |event|
  #   return true here if you want to ignore based on the event
  # end

  # Lograge支持多种输出格式。 最常见的是上述默认Lograge键值格式。 另外，您还可以生成Logstash使用的json_event格式的JSON日志。
  # 使用logstash输出时，需要添加  gem logstash-event
  # config.lograge.formatter = Lograge::Formatters::Logstash.new
  #
  # 可用的日志格式有：
  # Lograge::Formatters::Lines.new
  # Lograge::Formatters::Cee.new
  # Lograge::Formatters::Graylog2.new
  # Lograge::Formatters::KeyValue.new  # lograge 的默认格式
  # Lograge::Formatters::Json.new
  # Lograge::Formatters::Logstash.new
  # Lograge::Formatters::LTSV.new
  # Lograge::Formatters::Raw.new       # 返回一个ruby的哈希对象
  # 除了格式化程序，您还可以通过传递一个响应#call的对象来自己操作数据：
  # config.lograge.formatter = ->(data) { "Called #{data[:controller]}" } # data is a ruby hash
end
