# == Route Map
#
#                         Prefix Verb     URI Pattern                                                                              Controller#Action
#                     admin_root GET      /admin(.:format)                                                                         admin/dashboard#index
#                admin_dashboard GET      /admin/dashboard(.:format)                                                               admin/dashboard#index
#                 admin_comments GET      /admin/comments(.:format)                                                                admin/comments#index
#                                POST     /admin/comments(.:format)                                                                admin/comments#create
#                  admin_comment GET      /admin/comments/:id(.:format)                                                            admin/comments#show
#                                DELETE   /admin/comments/:id(.:format)                                                            admin/comments#destroy
#                     simple_apm          /apm                                                                                     SimpleApm::Engine
#                        pg_hero          /pghero                                                                                  PgHero::Engine
#               new_user_session GET      /users/login(.:format)                                                                   users/sessions#new
#                   user_session POST     /users/login(.:format)                                                                   users/sessions#create
#           destroy_user_session DELETE   /users/logout(.:format)                                                                  users/sessions#destroy
# user_github_omniauth_authorize GET|POST /users/auth/github(.:format)                                                             users/omniauth_callbacks#passthru
#  user_github_omniauth_callback GET|POST /users/auth/github/callback(.:format)                                                    users/omniauth_callbacks#github
# user_wechat_omniauth_authorize GET|POST /users/auth/wechat(.:format)                                                             users/omniauth_callbacks#passthru
#  user_wechat_omniauth_callback GET|POST /users/auth/wechat/callback(.:format)                                                    users/omniauth_callbacks#wechat
#              new_user_password GET      /users/password/new(.:format)                                                            users/passwords#new
#             edit_user_password GET      /users/password/edit(.:format)                                                           users/passwords#edit
#                  user_password PATCH    /users/password(.:format)                                                                users/passwords#update
#                                PUT      /users/password(.:format)                                                                users/passwords#update
#                                POST     /users/password(.:format)                                                                users/passwords#create
#       cancel_user_registration GET      /users/cancel(.:format)                                                                  users/registrations#cancel
#          new_user_registration GET      /users/register(.:format)                                                                users/registrations#new
#         edit_user_registration GET      /users/edit(.:format)                                                                    users/registrations#edit
#              user_registration PATCH    /users(.:format)                                                                         users/registrations#update
#                                PUT      /users(.:format)                                                                         users/registrations#update
#                                DELETE   /users(.:format)                                                                         users/registrations#destroy
#                                POST     /users(.:format)                                                                         users/registrations#create
#          new_user_confirmation GET      /users/confirmation/new(.:format)                                                        users/confirmations#new
#              user_confirmation GET      /users/confirmation(.:format)                                                            users/confirmations#show
#                                POST     /users/confirmation(.:format)                                                            users/confirmations#create
#                new_user_unlock GET      /users/unlock/new(.:format)                                                              users/unlocks#new
#                    user_unlock GET      /users/unlock(.:format)                                                                  users/unlocks#show
#                                POST     /users/unlock(.:format)                                                                  users/unlocks#create
#                   users_logout GET      /users/logout(.:format)                                                                  users/sessions#destroy
#             authenticated_root GET      /                                                                                        static_pages#home
#           unauthenticated_root GET      /                                                                                        users/sessions#new
#                          users GET      /users(.:format)                                                                         users#index
#                                POST     /users(.:format)                                                                         users#create
#                       new_user GET      /users/new(.:format)                                                                     users#new
#                      edit_user GET      /users/:id/edit(.:format)                                                                users#edit
#                           user GET      /users/:id(.:format)                                                                     users#show
#                                PATCH    /users/:id(.:format)                                                                     users#update
#                                PUT      /users/:id(.:format)                                                                     users#update
#                                DELETE   /users/:id(.:format)                                                                     users#destroy
#                    sidekiq_web          /sidekiq                                                                                 Sidekiq::Web
#                   queue_status GET      /queue-status(.:format)                                                                  #<Proc:0x00007f8c33c050f0@(eval):19>
#                                GET      /*unmatched_route(.:format)                                                              application#route_not_found
#             rails_service_blob GET      /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#      rails_blob_representation GET      /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#             rails_disk_service GET      /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#      update_rails_disk_service PUT      /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#           rails_direct_uploads POST     /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
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

  # 配置 +devise+ 相关的路由
  draw :devise

  resources :users

  # 配置 +sidekiq+ 相关的路由
  draw :sidekiq

  # 配置 +api+ 相关的路由
  draw :api

  # 匹配未定义的路由到 application下的route_not_found 方法中。
  get '*unmatched_route', to: 'application#route_not_found'
end
