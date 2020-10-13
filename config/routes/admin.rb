namespace :admin do
  concerns :article_comments
  root 'dashboards#index', as: :root

  # devise相关路由
  devise_for :admins, path: "/", module: "admin/devise", singular: :admin, path_names: {
    sign_in: "login",
    sign_out: "logout",
    sign_up: "register"
  }

  # devise_scope :admin do
  #   get "logout", to: "devise/sessions#destroy"
  #   # 未登录的话就跳转到登录首页，也就是users/session#new
  #   unauthenticated do
  #     root "devise/sessions#new", as: :unauthenticated_root
  #   end
  # end
end
