ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :phone, :sex, :user_group_id, :address, :description, :head_image_url, :wechat_image_url, :school, :birthday, :weibo, :status, :last_update_time, :provider, :uid, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :phone, :sex, :user_group_id, :address, :description, :head_image_url, :wechat_image_url, :school, :birthday, :weibo, :status, :last_update_time, :provider, :uid, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
