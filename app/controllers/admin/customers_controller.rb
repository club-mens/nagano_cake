class Admin::CustomersController < ApplicationController
  #before_action :authenticate_admin!

  def index
    #@customers = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer)
  end

end
