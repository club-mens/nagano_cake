# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]
  
  def after_sign_in_path_for(resource)
    @customer =current_customer
    root_path
  end
  
  protected
  
  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
    return if !@customer
    if @customer.valid_password?(params[:customer][:password])
    end
  end
        
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
