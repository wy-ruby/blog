devise_for :admins, module: :users, path_names: {
    sign_in:  'login',
    sign_out: 'logout',
    sign_up:  'register'
}
# devise_scope :admin do
#   # 登录后的主页变成了 static_pages#home
#   authenticated do
#     root 'static_pages#home', as: :admin_root
#   end
#
#   # 未登录的话就跳转到登录首页，也就是users/session#new
#   unauthenticated do
#     root 'admins/login#new', as: :admin_root
#   end
# end
