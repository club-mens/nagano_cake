class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!


  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render :edit
    end
  end

  def confirm
  end

  def withdrawal
    
  end

end
