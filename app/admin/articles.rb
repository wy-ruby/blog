ActiveAdmin.register Article do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :content, :style, :status, :article_up, :ip, :qr_code, :user_id, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :content, :style, :status, :article_up, :ip, :qr_code, :user_id, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
