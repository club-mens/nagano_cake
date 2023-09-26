# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :reject_customer, only: [:create]
  
  def after_sign_in_path_for(resource)
    @customer =current_customer
    root_path
  end
  
  # def reject_customer
    # @customer = Customer.find_by(email: params[:custmer][:email])
    # if @customer
      # if @customer
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in


  # POST /resource/sign_in


  # DELETE /resource/sign_out

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
