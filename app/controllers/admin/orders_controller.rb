class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @total = 0
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    if @order.update(order_params)
      if @order.status == "confirmed_payment"
         @order_details.each do |order_detail|
          order_item.update(making_status: 1)
        end
        redirect_to request.referer
      elsif @order.status == "shipped"
        redirect_to admin_path
      else
        redirect_to request.referer
      end
    else
      render :show
    end
  end

    private
  
    def order_params
      params.require(:order).permit(:status)
    end
    
end
