class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!


  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @order.postage = 800
    @order.total_price = 0
  if params[:order][:select_address] == "0"
      @order.name = current_customer.full_name
      @order.address = current_customer.address
      @order.post_code = current_customer.post_code
  elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name
  elsif params[:order][:select_address] == "2"
      @order.post_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
  else
      redirect_to new_order_path
  end
    @cart_items = current_customer.cart_items
  end

  def complete

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save!

    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price = (cart_item.item.add_tax_price).floor
      @order_detail.order_id =  @order.id
      @order_detail.save
    end

    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end



  def index
    @orders = current_customer.orders.all.order(id: 'DESC')
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name, :status, :customer_id, :postage, :total_price)
  end

end
