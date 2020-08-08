ActiveAdmin.register SystemMessage do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_group_id, :user_id, :message_type, :topic, :content, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_group_id, :user_id, :message_type, :topic, :content, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
