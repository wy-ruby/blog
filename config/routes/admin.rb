namespace :admin do
  resources :articles

  devise_for :admins, path: "/", module: "admin/admins", singular: :admin, path_names: {
    sign_in: "login",
    sign_out: "logout",
    sign_up: "register"
  }

  devise_scope :admin do
    get "logout", to: "admins/sessions#destroy"
    # 未登录的话就跳转到登录首页，也就是users/session#new
    unauthenticated do
      root "admins/sessions#new", as: :root
    end
  end
end
