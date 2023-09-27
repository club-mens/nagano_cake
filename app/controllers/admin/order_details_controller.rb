class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order = Order.find(params[:order_id])
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @order.order_details.all
    if @order_ddetail.update(order_detail_params)
      if @order_details.exists?(making_status: 2)
        @order.update(status: 2)
      elsif @order_details.where(making_status: 3).count == @order_details.count
        @order.update(status: 3)
      end
      redirect_to request.referer
    else
      render 'orders/show'
    end
  end

  private

  def order_detail_params
    params.require(:order_item).permit(:making_status)
  end

end