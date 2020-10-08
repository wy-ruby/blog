# == Route Map
#
#                     Prefix Verb   URI Pattern                                                                              Controller#Action
#                 ru_captcha        /rucaptcha                                                                               RuCaptcha::Engine
#                 simple_apm        /apm                                                                                     SimpleApm::Engine
#                    pg_hero        /pghero                                                                                  PgHero::Engine
#               users_logout GET    /users/logout(.:format)                                                                  users/sessions#destroy
#       unauthenticated_root GET    /                                                                                        users/sessions#new
#           new_user_session GET    /users/login(.:format)                                                                   users/sessions#new
#               user_session POST   /users/login(.:format)                                                                   users/sessions#create
#       destroy_user_session DELETE /users/logout(.:format)                                                                  users/sessions#destroy
#          new_user_password GET    /users/password/new(.:format)                                                            users/passwords#new
#         edit_user_password GET    /users/password/edit(.:format)                                                           users/passwords#edit
#              user_password PATCH  /users/password(.:format)                                                                users/passwords#update
#                            PUT    /users/password(.:format)                                                                users/passwords#update
#                            POST   /users/password(.:format)                                                                users/passwords#create
#   cancel_user_registration GET    /users/cancel(.:format)                                                                  users/registrations#cancel
#      new_user_registration GET    /users/register(.:format)                                                                users/registrations#new
#     edit_user_registration GET    /users/edit(.:format)                                                                    users/registrations#edit
#          user_registration PATCH  /users(.:format)                                                                         users/registrations#update
#                            PUT    /users(.:format)                                                                         users/registrations#update
#                            DELETE /users(.:format)                                                                         users/registrations#destroy
#                            POST   /users(.:format)                                                                         users/registrations#create
#      new_user_confirmation GET    /users/confirmation/new(.:format)                                                        users/confirmations#new
#          user_confirmation GET    /users/confirmation(.:format)                                                            users/confirmations#show
#                            POST   /users/confirmation(.:format)                                                            users/confirmations#create
#            new_user_unlock GET    /users/unlock/new(.:format)                                                              users/unlocks#new
#                user_unlock GET    /users/unlock(.:format)                                                                  users/unlocks#show
#                            POST   /users/unlock(.:format)                                                                  users/unlocks#create
#                sidekiq_web        /sidekiq                                                                                 Sidekiq::Web
#               queue_status GET    /queue-status(.:format)                                                                  #<Proc:0x00007fe02eb107b8@(eval):19>
#             admin_articles GET    /admin/articles(.:format)                                                                admin/articles#index
#                            POST   /admin/articles(.:format)                                                                admin/articles#create
#          new_admin_article GET    /admin/articles/new(.:format)                                                            admin/articles#new
#         edit_admin_article GET    /admin/articles/:id/edit(.:format)                                                       admin/articles#edit
#              admin_article GET    /admin/articles/:id(.:format)                                                            admin/articles#show
#                            PATCH  /admin/articles/:id(.:format)                                                            admin/articles#update
#                            PUT    /admin/articles/:id(.:format)                                                            admin/articles#update
#                            DELETE /admin/articles/:id(.:format)                                                            admin/articles#destroy
#             admin_comments GET    /admin/comments(.:format)                                                                admin/comments#index
#                            POST   /admin/comments(.:format)                                                                admin/comments#create
#          new_admin_comment GET    /admin/comments/new(.:format)                                                            admin/comments#new
#         edit_admin_comment GET    /admin/comments/:id/edit(.:format)                                                       admin/comments#edit
#              admin_comment GET    /admin/comments/:id(.:format)                                                            admin/comments#show
#                            PATCH  /admin/comments/:id(.:format)                                                            admin/comments#update
#                            PUT    /admin/comments/:id(.:format)                                                            admin/comments#update
#                            DELETE /admin/comments/:id(.:format)                                                            admin/comments#destroy
#                 admin_root GET    /admin(.:format)                                                                         admin/dashboards#index
#          new_admin_session GET    /admin/login(.:format)                                                                   admin/devise/sessions#new
#              admin_session POST   /admin/login(.:format)                                                                   admin/devise/sessions#create
#      destroy_admin_session DELETE /admin/logout(.:format)                                                                  admin/devise/sessions#destroy
#         new_admin_password GET    /admin/password/new(.:format)                                                            admin/devise/passwords#new
#        edit_admin_password GET    /admin/password/edit(.:format)                                                           admin/devise/passwords#edit
#             admin_password PATCH  /admin/password(.:format)                                                                admin/devise/passwords#update
#                            PUT    /admin/password(.:format)                                                                admin/devise/passwords#update
#                            POST   /admin/password(.:format)                                                                admin/devise/passwords#create
#  cancel_admin_registration GET    /admin/cancel(.:format)                                                                  admin/devise/registrations#cancel
#     new_admin_registration GET    /admin/register(.:format)                                                                admin/devise/registrations#new
#    edit_admin_registration GET    /admin/edit(.:format)                                                                    admin/devise/registrations#edit
#         admin_registration PATCH  /admin(.:format)                                                                         admin/devise/registrations#update
#                            PUT    /admin(.:format)                                                                         admin/devise/registrations#update
#                            DELETE /admin(.:format)                                                                         admin/devise/registrations#destroy
#                            POST   /admin(.:format)                                                                         admin/devise/registrations#create
#     new_admin_confirmation GET    /admin/confirmation/new(.:format)                                                        admin/devise/confirmations#new
#         admin_confirmation GET    /admin/confirmation(.:format)                                                            admin/devise/confirmations#show
#                            POST   /admin/confirmation(.:format)                                                            admin/devise/confirmations#create
#           new_admin_unlock GET    /admin/unlock/new(.:format)                                                              admin/devise/unlocks#new
#               admin_unlock GET    /admin/unlock(.:format)                                                                  admin/devise/unlocks#show
#                            POST   /admin/unlock(.:format)                                                                  admin/devise/unlocks#create
#               admin_logout GET    /admin/logout(.:format)                                                                  admin/devise/sessions#destroy
# admin_unauthenticated_root GET    /admin(.:format)                                                                         admin/devise/sessions#new
#                      users GET    (/:locale)/users(.:format)                                                               users#index {:locale=>/en|zh-CN/}
#                            POST   (/:locale)/users(.:format)                                                               users#create {:locale=>/en|zh-CN/}
#                   new_user GET    (/:locale)/users/new(.:format)                                                           users#new {:locale=>/en|zh-CN/}
#                  edit_user GET    (/:locale)/users/:id/edit(.:format)                                                      users#edit {:locale=>/en|zh-CN/}
#                       user GET    (/:locale)/users/:id(.:format)                                                           users#show {:locale=>/en|zh-CN/}
#                            PATCH  (/:locale)/users/:id(.:format)                                                           users#update {:locale=>/en|zh-CN/}
#                            PUT    (/:locale)/users/:id(.:format)                                                           users#update {:locale=>/en|zh-CN/}
#                            DELETE (/:locale)/users/:id(.:format)                                                           users#destroy {:locale=>/en|zh-CN/}
#         rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#  rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#         rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#  update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#       rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
#
# Routes for RuCaptcha::Engine:
#   root GET  /           ru_captcha/captcha#index
#
# Routes for SimpleApm::Engine:
#    dashboard GET  /dashboard(.:format)    simple_apm/apm#dashboard
#        index GET  /index(.:format)        simple_apm/apm#index
#         show GET  /show(.:format)         simple_apm/apm#show
#  action_info GET  /action_info(.:format)  simple_apm/apm#action_info
#      actions GET  /actions(.:format)      simple_apm/apm#actions
#         data GET  /data(.:format)         simple_apm/apm#data
#  data_delete GET  /data_delete(.:format)  simple_apm/apm#data_delete
# set_apm_date GET  /set_apm_date(.:format) simple_apm/apm#set_apm_date
#         root GET  /                       simple_apm/apm#dashboard
#
# Routes for PgHero::Engine:
#                     space GET  (/:database)/space(.:format)                     pg_hero/home#space
#            relation_space GET  (/:database)/space/:relation(.:format)           pg_hero/home#relation_space
#               index_bloat GET  (/:database)/index_bloat(.:format)               pg_hero/home#index_bloat
#              live_queries GET  (/:database)/live_queries(.:format)              pg_hero/home#live_queries
#                   queries GET  (/:database)/queries(.:format)                   pg_hero/home#queries
#                show_query GET  (/:database)/queries/:query_hash(.:format)       pg_hero/home#show_query
#                    system GET  (/:database)/system(.:format)                    pg_hero/home#system
#                 cpu_usage GET  (/:database)/cpu_usage(.:format)                 pg_hero/home#cpu_usage
#          connection_stats GET  (/:database)/connection_stats(.:format)          pg_hero/home#connection_stats
#     replication_lag_stats GET  (/:database)/replication_lag_stats(.:format)     pg_hero/home#replication_lag_stats
#                load_stats GET  (/:database)/load_stats(.:format)                pg_hero/home#load_stats
#          free_space_stats GET  (/:database)/free_space_stats(.:format)          pg_hero/home#free_space_stats
#                   explain GET  (/:database)/explain(.:format)                   pg_hero/home#explain
#                      tune GET  (/:database)/tune(.:format)                      pg_hero/home#tune
#               connections GET  (/:database)/connections(.:format)               pg_hero/home#connections
#               maintenance GET  (/:database)/maintenance(.:format)               pg_hero/home#maintenance
#                      kill POST (/:database)/kill(.:format)                      pg_hero/home#kill
# kill_long_running_queries POST (/:database)/kill_long_running_queries(.:format) pg_hero/home#kill_long_running_queries
#                  kill_all POST (/:database)/kill_all(.:format)                  pg_hero/home#kill_all
#        enable_query_stats POST (/:database)/enable_query_stats(.:format)        pg_hero/home#enable_query_stats
#                           POST (/:database)/explain(.:format)                   pg_hero/home#explain
#         reset_query_stats POST (/:database)/reset_query_stats(.:format)         pg_hero/home#reset_query_stats
#              system_stats GET  (/:database)/system_stats(.:format)              redirect(301, system)
#               query_stats GET  (/:database)/query_stats(.:format)               redirect(301, queries)
#                      root GET  /(:database)(.:format)                           pg_hero/home#index

Rails.application.routes.draw do
  # 配置 simple_apm 的路由
  mount SimpleApm::Engine => "/apm"

  # 配置 pghero 的路由。这是pg数据库的性能仪表盘
  mount PgHero::Engine, at: "pghero"

  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
  # 配置 +devise+ 前台相关的路由
  draw :devise
  # 配置 +api+ 相关的路由
  draw :api
  # 配置 +sidekiq+ 相关的路由
  draw :sidekiq
  # 配置 +admin+ 相关的路由
  draw :admin

  # 要想使用 http://localhost:3000/en/books（加载英语区域设置）和 http://localhost:3000/zh-CN/books（加载中文区域设置），我们
  # 可以使用前文提到的覆盖 default_url_options 方法的方式，通过 scope 方法设置路由：
  scope "(:locale)", locale: /en|zh-CN/ do
    resources :users
  end

  # 匹配未定义的路由到 application下的route_not_found 方法中。
  get "*unmatched_route", to: "application#route_not_found", as: :not_found if Rails.env.production?
end
