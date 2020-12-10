source "https://gems.ruby-china.com"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.8"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.2.4"

# 使用pg数据库
# 注意使用pg数据库的话，需要在系统中安装 yum install postgresql-devel 的支持。
gem "pg"
# pg数据库的性能仪表板
gem "pg_query", "~> 1.2.0"
gem "pghero"

# Use Puma as the app server
gem "puma"

# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"

# Ruby 包装 UglifyJS（使用 NodeJS 开发），作用是通过删除空白和注释、缩短局部变量名及其他微小
# 优化（例如在可能的情况下把 if&#8230;&#8203;else 语句修改为三元运算符）压缩 JavaScript 代码。
gem "uglifier"

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"

# 在rails中使用 react
gem "react-rails"

# Turbolinks
# 详情参考链接: https://github.com/turbolinks/turbolinks 或者参考docs/Turbolinks.md
gem "turbolinks", "~> 5.2"

# 使用生成器生成JSON对象，常见如views/**/xxx.json.jbuilder文件 .详细见: /docs/Jbuilder.md
gem "jbuilder", "~> 2.10"

# Use ActiveModel has_secure_password
gem "bcrypt", "~> 3.1"

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Reduces boot times through caching; required in config/boot.rb
# 使用缓存的方式加快rails应用的启动速度。缓存到tmp/cache目录下，一般是该目录下的bootsnap*文件夹
gem "bootsnap", "~> 1.4.0", require: false

# 是用于编译和服务assets的Ruby库
gem "sprockets", "~> 3.0"

# 异步队列。
gem "sidekiq"
# 在sidekiq的worker中进行周期性的执行,向Sidekiq添加了重复的作业。
# gem 'mini_scheduler'
# sidekiq 定时执行
# gem 'sidekiq-cron'

# 写入Linux中的crontab定时任务的一个ruby的DSL
gem "whenever", require: false

# Ruby国际化和本地化的解决方案
gem "i18n"
gem "rails-i18n"

# redis相关的。 hiredis是一个高性能的redis两者结合用，和redis这个gem结合用。当您有大量回复（例如：lrange、smembers、zrange等）或
# 使用大型管道时，最好使用hiredis。
# redis-rails和redis-rack-cache是提供了完整的一套如(cache,session,http cache)等存储功能的包。如果rails是5.2及以上的版本，并且只
# 需要使用片段缓存的话就不需要这个了，rails5.2已经有了。
# redis-namespace这个是可以让redis在配置文件中设置命名空间的gem包
gem "hiredis", "~> 0.6.1"
gem "redis", "~> 4"
gem "redis-namespace"

gem "redis-rack-cache"
gem "redis-rails"

# 数据库初始数据相关。默认读取的是db/fixtures下的文件。
gem "seed-fu"

# 上传组件
# gem "carrierwave"

# rails中使用jquery
gem 'jquery-rails'
# bootstrap中依赖的js
gem 'popper_js'

# 前端ui框架bootstrap
gem "bootstrap", "~> 4.5.0"
# font-awesome-rails提供了Font-Awesome Web字体和样式表，作为与asset pipeline 一起使用的Rails引擎。
gem "font-awesome-rails"

# 更简单更强大的表单创建。
# gem 'simple_form', '~> 4.0.0'

# 简化模板
# gem "haml-rails", "~> 2.0"
# gem 'slim-rails'

# 静态页面相关的gem
# gem 'high_voltage', '~> 3.0.0'

# 验证码
gem "rucaptcha"

# 监控 数据库、redis、Cache、Sidekiq、Resque的状态的工具。
# gem 'status-page'

# paper_trail 跟踪对模型的更改，以进行审核或版本控制。
# gem 'paper_trail'

# elasticsearch中的apm瓶颈监控工具
# gem 'elastic-apm'
# gem "elasticsearch-model"
# gem "elasticsearch-rails"
# 配套 es 的使用的搜索工具
# gem 'searchkick'

# 用户系统
gem "devise"

# 可以为我们的应用加入操作权限控制。
gem "pundit"
# 搭配devise、pundit使用，添加role对权限更加精细化的操作，比如实现RBAC权限管理。
gem "rolify"
# 权限管理这一块或者可以使用下面的这个
# gem "cancancan"

# 三方平台 OAuth 验证登陆
gem "omniauth"
gem "omniauth-github"
gem "omniauth-wechat-oauth2"

# 提供Oauth2授权服务
# gem 'doorkeeper'

# 中国的省市县区的数据库
# gem 'china_regions'

# 使用JWT实现Token认证
gem "jwt"
# 符合 JWT (JSON Web Token) 规范的认证 API
gem "knock"

# grape 可以帮助我们快速的构建和 Rails 完美融合的 API 接口。
gem "grape"
gem "grape-swagger"
gem "grape-swagger-rails"
gem "grape-entity"
gem "grape-swagger-entity"
gem "grape_logging"
# 展示 grape api 的路由
gem "grape_on_rails_routes"

# GraphQL一种用于 API 的查询语言
gem "graphql"

# 在Rails应用程序中安装GraphiQL查询编辑器
# gem 'graphiql-rails', '~> 1.7.0'

# 更高性能的json解析包
# gem 'oj'

# 邮件服务
# gem "postmark"
# gem "postmark-rails"

# 拒绝低版本浏览器的访问，并给其返回一个让其升级的页面。
gem "browser_warrior", ">= 0.8.0"

# 异常监控通知
# gem 'exception_notification'
# 在后台管理页面显示异常信息
# gem 'exception-track'
# gem 'slack-notifier'

# RPC远程过程调用
# gem 'grpc'

# 用于处理跨域资源共享（CORS）的机架中间件，这使得跨域AJAX成为可能。
# gem 'rack-cors'

# 赞、关注、收藏、屏蔽等功能的数据结构
# gem "action-store"

# 快速创建后台管理
# gem 'activeadmin'
# 后台管理的前端UI
# gem 'rails_admin'
# 更方便快捷的创建后台管理页面
# gem 'trestle'

# 能创造简单并且比较高级的搜索条件。
gem "ransack"

# # Kaminari是一个基于范围和引擎的、干净、强大、可自定义复杂条件的分页器。
gem "kaminari"

# 基于Redis的简单的Web请求性能监控/慢事务追踪工具
gem "simple_apm"

# 管理配置信息的库。
# gem "rails-settings-cached", "~> 2.0"

# 一个使用 Ruby 连接和操作 RabbitMQ 的客户端
gem "bunny", "~> 2.14.1"
# 业务通过 Bunny 在 Rails 中简易、快速地生产发布了消息，就需要有消费者来接收和消费消息，
# Sneakers 是一个处理 RabbitMQ 消息队列的高性能 Ruby 框架
gem "sneakers"

# aasm ruby类的状态机（支持普通Ruby，ActiveRecord，Mongoid）
gem "aasm"

# 一些使用rack协议编写的小工具。
gem "rack-contrib"

# 保护你的应用免收不良客户端的请求的拦截器。
gem "rack-attack"

# bugsnage Ruby的Bugsnag异常报告器会立即通知您从Rails，Sinatra，Rack或纯Ruby应用程序引发的异常。
# 任何未捕获的异常都会触发通知，该通知将发送到您的Bugsnag项目。
# gem "bugsnag", "~> 6.12"
# gem "uniform_notifier"

# URL 友好的 ID，可以把一些不想暴露的url地址中的信息给使用id替代掉。
# gem 'friendly_id', '~> 5.2.4'

# 所见即所得编辑器
gem "ckeditor"

# 改变 rails 默认的日志，使变得更好。更简洁且高效的显示日志内容。
gem "lograge"
# Logstash与Beats，Elasticsearch和Kibana一起是Elastic Stack的一部分。
# Logstash是服务器端数据处理管道，它同时从多个源中提取数据，进行转换，然后将其发送到您喜欢的“stash”。
gem "logstash-event", require: false
gem 'logstash-logger', require: false

# Logster是嵌入式Ruby“例外报告服务”，管理员可以在实时网站上查看。可以在生产上方便查看日志一般是 /logs 路由中。
gem 'logster'

# 搜索引擎优化(SEO)插件Ruby on Rails应用。
gem 'meta-tags'

# 从后台推送消息到浏览器上。
# gem 'webpush'

# 用于解析json数据
# gem 'oj'

# 命令行命令构建工具
# gem 'thor'

# 支持 Ruby 开发者轻松访问阿里云服务，例如：弹性云主机（ECS）、负载均衡（SLB）、云监控（CloudMonitor）等。 您无需处理API相关
# 业务（如签名和构建请求）即可访问阿里云服务。
# gem 'aliyunsdkcore'
# 阿里云短信
# gem 'aliyun-sms'

# scenic可以将SQL视图的功能带到Rails应用程序中
# gem "scenic"

# 序列化model中的字段
# gem 'active_model_serializers', '~> 0.10.0'

# 用来配置环境变量存储私密（如数据库密码，邮箱密码等）信息。实际上这个gem和 dotenv-rails 类似，看具体的技术选型。
# gem "figaro"

# 地理位置信息的计算（通过经纬度）的一个gem
# gem "geocoder"

# 静态页面缓存，可以缓存那些静态资源，然后通过配置 nginx ，让这些缓存的路由直接通过 nginx 代理，使之根本不走 rails。
# 然后配合 rails-observers 当模型发生更新或者删除的时候可以通过回调去删除静态页面缓存资源，使静态资源"动态化"。
# gem "actionpack-page_caching"
# gem "rails-observers"

# 生成文档工具
gem "sdoc"

# 异常监控，可以把异常信息写入数据库。
gem 'exception_notification'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]

  # 开发环境中发邮件的时候不用发到真实的邮箱中了。不过感觉mailcatcher更简单方便
  # gem "letter_opener"
  # 本地架设一个最简单的邮件服务器，不真实发送邮件。这个由于依赖的gem的版本兼容的问题就不在Gemfile中引入了，直接在命令行安装。
  # gem "mailcatcher"

  # 用于定义和使用工厂的框架和DSL，用来帮助测试
  gem "factory_bot_rails"

  # faker生成伪数据。
  gem 'faker'

  # 一个提供“时间旅行”和“时间冻结”功能的gem，使测试依赖于时间的代码变得非常简单。它提供了
  # 一个统一的方法，可以在单个调用中模拟Time.now，Date.today和DateTime.now。
  gem 'timecop'

  # rails 使用rspec进行测试
  gem "rspec-rails", "~>4.0"
  # 实际上rspec-rails是依赖下面的这些gem的，所以只需要安装rspec-rails即可。
  # gem "rspec","~>3.10"
  # gem "rspec-mocks","~>3.10"
  # gem "rspec-support","~>3.10"
  # gem "rspec-expectations","~>3.10"
  # gem "rspec-core","~>3.10"

  # 在测试和开发环境中配置环境变量，使用ENV引入
  # gem 'dotenv-rails'
end

group :development do
  # web-console是RubyonRails应用程序在浏览器上的调试工具,报错的时候可以调试的。
  gem "web-console"

  # 监听文件变动，并你去通知修改
  gem "listen", "~> 3.2"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # 运行测试时，保持development在后台运行，不需要重启
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"

  # capistrano相关的gem。如果服务器没有安装rvm及ruby可以使用rvm1-capistrano3这个gem去在服务端自动安装。
  gem "capistrano", "~> 3.11", require: false
  gem "capistrano-bundler", "~> 2.0", require: false
  gem "capistrano-rails", "~> 1.4", require: false
  gem "capistrano-rvm", require: false
  # 可以在服务器安装rvm及ruby的工具。
  gem "capistrano-sidekiq"
  gem "capistrano3-puma"
  gem "rvm1-capistrano3", require: false

  # 用于调试代码的一些工具
  gem "pry"
  gem "pry-byebug"
  gem "pry-rails"
  gem "pry-remote"

  # 友好且详尽的错误显示页面
  gem "better_errors"
  gem "binding_of_caller"
  # 性能分析工具
  gem "rubycritic", require: false

  # 代码风格指南工具。具体使用,在根目录输入命令 rubocop -h 查看即可。 rubocop ./config/deploy
  gem "rubocop", "~> 0.85.0", require: false
  gem "rubocop-performance", "~> 1.6.0", require: false
  gem "rubocop-rails", require: false

  # 对应用进行基准测试。命令：  bundle exec derailed bundle:mem   使用 derailed -h查看可用命令
  gem "derailed_benchmarks"
  gem "stackprof"

  # 一个文档生成工具
  gem "yard", ">= 0.9.20"

  # 代码质量控制。使用命令： rails_best_practices .    -h帮助
  gem "rails_best_practices"

  # model中自动生成数据表相关的文档。命令 rails g annotate:install 生成一个rake，之后db:migrate的时候会自动更新model中的文档了。
  # rake annotate_routes 该命令生成路由相关的文档
  gem "annotate"

  # Chrome中的扩展，可以在Chrome开发者工具中查看如请求响应时间等的详细信息。
  gem "meta_request"

  # 检查没有用到的routes。 执行命令 rake traceroute
  gem "traceroute"

  # 语法漏洞检测工具。命令 brakeman  或者brakeman ./config/deploy.rb,具体的可用brakeman -h
  gem "brakeman"

  # 帮助解决rails的N+1问题
  gem "bullet"

  # 在日志中写入请求源信息
  gem "active_record_query_trace"

  # 给你的MacOS的发送通知消息
  # gem 'terminal-notifier'

  # 一个让你一修改测试文件，就自动跑测试的工具。
  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-rspec', '~> 4.7', require: false

  # graphql 初始化的时候引入的。
  gem 'graphiql-rails'
end

group :test do
  # 基于rake的Web应用程序的集成测试工具。它模拟用户如何与网站交互
  gem "capybara", ">= 2.15"
  # 是Capybara的纯Ruby驱动，它允许您在无头的Chrome或Chromium上运行Capybara测试。。
  gem "cuprite"
  # 用于集成测试HTML表单
  # gem "formulaic"
  # 配合 capybara 使用，是一种从ruby程序内部启动外部应用程序的通用方法。
  gem "launchy"

  # 用来精简 rspec 测试代码编写的gem
  gem 'shoulda-matchers', '~> 4.0'

  # 模拟用户的行为，与html交互
  gem "selenium-webdriver"

  # 可以更轻松地运行Selenium(浏览器自动测试框架)测试。
  gem "webdrivers"

  # BDD 行为驱动开发
  # gem 'cucumber'
  # gem 'cucumber-rails', require: false
  # gem 'cucumber-api-steps', require: false

  # 清理数据库的策略。可用于确保测试的清洁状态。
  gem "database_cleaner"
  gem "database_cleaner-active_record"
  gem "database_cleaner-redis"

  # 记录测试套件的HTTP交互(如调用三方api时，但是它们有限制次数，或者如阿里云短信付费)，并在以后的测试运行期间重播它们，以进行快速，准确的测试。
  # gem "vcr"

  # 配置测试需要的数据
  gem "webmock"

  # 代码覆盖率工具。产生精美的报告。
  gem "simplecov", require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
