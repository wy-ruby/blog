# frozen_string_literal: true

class Admin::Devise::SessionsController < Devise::SessionsController
  layout "login", only: :new
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    if verify_rucaptcha?
      binding.pry
      super
    else
      redirect_back(fallback_location: admin_root_path)
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected
    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    end
end
