# config valid for current version and patch releases of Capistrano
# 默认在部署的服务器上的部署目录（默认是 { "/var/www/#{fetch(:application)}" })中生成下列的文件目录结构。
# ├── current -> /var/www/my_app_name/releases/20150120114500/
# ├── releases
# │   ├── 20150080072500
# │   ├── 20150090083000
# │   ├── 20150100093500
# │   ├── 20150110104000
# │   └── 20150120114500
# ├── repo
# │   └── <VCS related data>
# ├── revisions.log
# └── shared
#     └── <linked_files and linked_dirs>
# capistrano用法：
# 1. 设置变量：  set :application, 'MyLittleApplication'。
# 2. 获取设置变量的值： fetch(:application, "default"),第一个参数是要获取值的键，第二个参数是如果没有获取到值，就使用这个作为默认值。
# 3. 设置数组： append :linked_dirs, [".bundle", "tmp", "log"]
# 4. 移除数组中的值：remove :linked_dirs, ".bundle", "tmp" ,可以省略数组的中括号。
# 5. 用户在部署的时候手动输入命令： ask(:database_name, "default_database_name")，第二个参数是不输入的时候默认。第三个参数是一个哈希
#    比如可以设置echo: true这个配置是在命令终端输入的时候显示用户输入的内容，可以设置false不显示用户输入。然后用fetch(:database_name)获取
#
# ﻿执行cap production deploy的时候都执行了什么？按照怎样的顺序执行的？下面是其执行顺序及过程
# deploy:starting    - start a deployment, make sure everything is ready
# deploy:started     - started hook (for custom tasks)
# deploy:updating    - update server(s) with a new release
# deploy:updated     - updated hook
# deploy:publishing  - publish the new release
# deploy:published   - published hook
# deploy:finishing   - finish the deployment, clean up everything
# deploy:finished    - finished hook
#
# 当执行cap production deploy:rollback回滚的时候都执行了什么？顺序是什么？
# deploy:starting
# deploy:started
# deploy:reverting           - revert server(s) to previous release
# deploy:reverted            - reverted hook
# deploy:publishing
# deploy:published
# deploy:finishing_rollback  - finish the rollback, clean up everything
# deploy:finished
#
# sshkit的一些常用命令参考链接： https://github.com/capistrano/sshkit#the-command-map
# capistrano中的命令： 1.cap production console 这个命令是进入连接的服务器的控制台
# 部署时，仍可以忽略提交到版本控制（即不在.gitignore中）的文件。要忽略这些文件或目录，只需将它们添加到.gitattributes：
# 注意：是先执行deploy.rb下的文件，再执行deploy/*.rb文件的。如果是想要在deploy.rb中获得deploy/*.rb中的变量可以使用延迟加载。
#
#


lock '~> 3.11.0'

# 部署后，在shared文件夹中创建下列这些文件夹，并把文件夹软链接到rails对应的目录中去。可用于永久目录。
# .bundle 文件也是会被设置在shared文件夹下的，该目录中有一个配置文件，配置所有的gem包的存放位置的，存放目录一般是shared/bundle/ruby/2.3.0/gems
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'
# 在部署期间，列出的文件将从应用程序的共享文件夹(shared)中链接到每个发布目录。可用于持久性配置文件，如database.yml等文件。
# 注意这里rails是5.2版本的，从这个版本开始，config/secrets.yml变成了config/master.key，即低于5.2版本的话要引入的是secrets.yml,否则会报错。
# 注意这些手动添加的配置中需要有对应的内容，否则也会报错
append :linked_files, 'config/database.yml', 'config/application.yml', 'config/redis.yml', 'config/master.key'

# 服务器上的ruby版本以及gemset名
# @ruby_version = '2.5.1'
@rvm_version = '2.5.1@init_gems'

# 项目仓库配置
@project_name = 'init_gems'
@git_url = 'git@github.com:wy-ruby'
@repo_url = "#{@git_url}/#{@project_name}.git"

# 服务器上部署的路径配置
# 该项一般配置在config/deploy下的环境中
set :application, 'init_gems'
@complete_app_dir = "/home/live/#{fetch(:application)}"

# 输入要发布的分支
# ask(:use_branch, 'master', echo: true)
# @branch = fetch(:use_branch)
@branch = 'master'


# capistrano这个gem本身的参数设置,还包括上面配置的:application以及:linked_dirs和:linked_files这两个数组。
# # 部署的服务器的路径。默认是 { "/var/www/#{fetch(:application)}" }
set :deploy_to, @complete_app_dir
# 部署的仓库的地址配置
set :repo_url, @repo_url
# 仓库的分支，默认是master
set :branch, @branch
# 是否使用SSHKit 详见 https://github.com/capistrano/sshkit/，该值为true会影响sidekiq的启动。
set :pty, true
# 使用SSHKit的时候，选择的日志的层级。有:info, :warn，:error, :debug
set :log_level, :debug
# 部署代码过程中打印的日志的格式，默认是airbrussh(打印的日志是:warn or :error)。
# 还有其他的变量 :dot和 :pretty,使用:dot或者:pretty(格式相对比较好看些)打印配置的。
set :format, :pretty
# 保留最近多少次的部署，在服务器上是release文件夹中存在多少个对应的源码的文件夹。
set :keep_releases, 5
# 设置部署的服务器端的共享文件夹目录名。默认: shared
set :shared_directory, 'shared'
# 设置部署的服务器端的发布的文件夹目录名。默认: releases
set :releases_directory, 'releases'
# 设置指向当前最新成功部署发布文件夹的当前链接的名称。默认: current
set :current_directory, 'current'
# 配置源码管理工具。目前支持 :git 、:hg 、 :svn，默认是：git
# set :scm, :git
# capistrano这个gem本身的参数设置，结束。
# 远程的repo目录配置, 默认是 "#{fetch(:deploy_to)}/repo"。通常不需要设置的
# set :repo_path, "#{@repo_url}/repo"
# 您可能会遇到只想部署到配置中定义的服务器子集的情况。例如，单个服务器或一组服务器可能行为不正常，您希望仅重新部署到这些服务器，而不部署到每个服务器。
# set :filter, :hosts => %w{server1 server2}
# 也可以过滤用户，还有另外两种方法对用户及服务器进行过滤：1. ROLES=app,web cap production deploy 2. cap --roles=app,web production deploy
# set :filter, :roles => %w{app web}
# capistrano这个gem本身的参数设置。结束


# 在capistrano-rails中的配置。
# 设置release的目录格式
set :release_name, Time.now.strftime('%Y%m%d%H%M%S')
# 格式化部署的时候显示的工具,设置其颜色以及保存的日志目录和字符宽度。在3.5以上的版本中 默认的
set :format_options, color: true, truncate: 80, log_file: 'log/capistrano.log', command_output: true
# 如果db/migrate文件没有改变就跳过
set :conditionally_migrate, true
# 配置assets的目录，压缩编译静态文件在该配置下的目录进行。
set :assets_manifests, ['app/assets/config/manifest.js']
# 配置assets:precompile task中的RAILS_GROUPS的环境变量的值。
# set :rails_assets_groups, :assets
# 虽然迁移一般是针对数据库的，但是在rails中数据库的迁移和rails框架密切相关，因此这里设置为应用 :app，而不是 :db
set :migration_role, :app
# 创建文件夹public/images, public/javascripts, 以及 public/stylesheets在每个部署的服务器上
set :normalize_asset_timestamps, %w[public/images public/javascripts public/stylesheets]
# 设置编译的静态资源角色
set :assets_roles, %i[web app]


# bundle相关。本身deploy.rake有做在updating的时候设置set_release_path的，然后就可以设置对应的release_path了，但是不知道为什么没有设置
# 所以这里需要在第一次发布的时候设置下，之后必须要删除了，并设置set :bundle_gemfile, -> { current_path.join('Gemfile') }即可
# set_release_path
# set :bundle_gemfile, -> { release_path.join('Gemfile') }


# capistrano3版本及以上引入whenever的时候带上该命令是可以执行whenever -i的，即更新crontab的配置。
# set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }
# set :default_env, BUNDLE_GEMFILE: "#{release_path}/Gemfile"
# set :whenever_load_file, -> { File.join(release_path, 'config', 'schedule.rb') }


# 配置unicorn的运行的目录
# set :unicorn_config_path, -> { File.join(release_path, 'config', 'unicorn.rb') }
# 必须要设置该参数，否则无法执行。
# set :unicorn_roles, %i[db app web]
# 这个参数必须要配置，要不然会默认执行development环境的。
# set :unicorn_rack_env, -> { fetch(:stage) }


# 配置sidekiq,这里不需要去设置sidekiq的启动或者重启，在capistrano_sidekiq中已经自动执行了。
# set :sidekiq_config, "#{release_path}/config/sidekiq.yml"
# 这个参数必须要设置，否则无法执行。
# set :sidekiq_roles, %i[db app web]

# 配置puma


# 配置rvm的ruby版本以及gemset。capistrano-rvm这个gem的配置。
set :rvm_ruby_version, @rvm_version

# 配置要安装的gem版本，这个是rvm1-capistrano3这个gem的配置。
# set :rvm1_ruby_version, @ruby_version
# rvm1-capistrano3这个gem的功能，并且该gem可以自动创建gemset
# 可以安装rvm
# before 'deploy', 'rvm1:install:rvm'
# 可以安装ruby
# before 'deploy', 'rvm1:install:ruby'
# 配置rvm-auto.sh文件所在的目录
# set :rvm1_auto_script_path, File.expand_path("../", fetch(:deploy_to))


# 使用unicorn去运行该命令，如果是首次运行或者服务器端的unicorn进程挂掉的情况的话使用unicorn:start，其他的情况使用unicorn:restart或者unicorn:legacy_restart
# after 'deploy:publishing', 'deploy:restart'
# 执行db/fixtures/*下的任务
# before 'deploy:publishing', 'db:seed_fu'
# 等发布完成之后把那些没有用到的gem给删除了,这个建议等删除的gem比较多的话再用。
# after 'deploy:published', 'bundler:clean'

# before 'deploy', 'deploy:first_deploy'
# before 'deploy', 'deploy:check'

namespace :deploy do
  # 如果是第一次部署的话需要执行的操作
  task :first_deploy do
    on roles(:all) do
      if test ("[! -d #{fetch(:deploy_to)}]")
        invoke "deploy:curd_database"
        invoke "deploy:upload_linked_files"
      end
    end
  end

  # 自定义了一个部署任务, 即自动运行 rake RAILS_ENV=rails_env db:create
  # 其中 release_path 指的是当前 release 目录
  # `fetch(:rails_env)` 读取配置中的 rails_env 变量, 并在 rake 命令中带上 env 变量
  task :create_database do
    on roles(:db) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          # execute :rake, 'db:create' #如果是第一次部署可以加上该行代码以便创建数据库。
          # 根据设置的：rails_evn的变量配置对应的RAILS_ENV环境，然后进行rake下的migrate操作
          execute :rake, 'db:create'
        end
      end
    end
  end

  # 给服务器上，上传必要的文件
  task :upload_linked_files do
    on roles(:app) do
      fetch(:linked_files) do |filename|
        upload! filename, shared_path
      end
    end
  end

  # 重启unicorn服务
  task :restart do
    invoke 'unicorn:legacy_restart'
  end

end
