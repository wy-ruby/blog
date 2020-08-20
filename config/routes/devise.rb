# get "/auth/:action/callback", :controller => "authentications", :constraints => { :action => /wechat|github/ }
# get "/auth/:provider/callback" => "authentications#github"

# 注意：devise_for :users 中登录的默认的 url 是/users/login。如果想在去掉路由中的/users变成 /login也能登录
# 那就用 devise_scope :user {} 这样形式的，块中的内容就是去掉/users的。注意 devise_scope的别名是 as
devise_scope :user do
  get "users/logout", to: "users/sessions#destroy"
  # 未登录的话就跳转到登录首页，也就是users/session#new
  unauthenticated do
    root "users/sessions#new", as: :unauthenticated_root
  end
end
# 查找用户的命名空间，默认是使用devise/sessions, devise/registrations的控制器，这里可以通过module选项修改成users。
# 此时就是使用users/sessions, users/registrations作为默认控制器了。
devise_for :users, module: :users, path_names: {
  sign_in: "login",
  sign_out: "logout",
  sign_up: "register"
}
