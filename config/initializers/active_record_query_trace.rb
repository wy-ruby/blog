# 在开发模式下进行日志的堆栈追踪
if Rails.env.development?
  ActiveRecordQueryTrace.enabled = true
  # Optional: other gem config options go here

  # 调试的级别。默认 :app
  # :app -> 仅包含应用程序跟踪行（Rails.root目录中的文件）
  # :rails -> 包括除应用程序中的跟踪线以外的所有跟踪线（Rails.root中的文件以外的所有文件）
  # :full -> 完整的回溯（包括所有文件），对于调试gem很有用。
  # 如果需要更多控制，可以使用：custom级别提供自定义 backtrace cleaner。例如：
  # ActiveRecordQueryTrace.level = :custom
  # require "rails/backtrace_cleaner"
  # ActiveRecordQueryTrace.backtrace_cleaner = Rails::BacktraceCleaner.new.tap do |bc|
  #   bc.remove_filters!
  #   bc.remove_silencers!
  #   bc.add_silencer { |line| line =~ /\b(active_record_query_trace|active_support|active_record|another_gem)\b/ }
  # end
  ActiveRecordQueryTrace.level = :app

  # 数据库的读、写或者两者都。:read|:write|:all  默认:all
  ActiveRecordQueryTrace.query_type = :all

  # 调用栈查询的行数。默认是5
  ActiveRecordQueryTrace.lines = 5

  # 日志进行颜色定制。默认 :false 不设置颜色。可用颜色有: :black, :red, :green, :brown, :blue, :purple, :cyan,
  # :gray, :dark_gray, :light_red, :light_green, :yellow, :light_blue, :light_purple, :light_cyan, :white
  ActiveRecordQueryTrace.colorize = :green
end