class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    if params[:order][:address_select] == 'own_address'
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:address_select] == 'registered_address'
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_select] == 'new_address'
      @order = Order.new(order_params)
      address = Address.new(new_address_params)
      session[:address] = address
    end
    @cart_items = current_customer.cart_items.all
    total_price = 0
    @cart_items.each do |cart_item|
      total_price = total_price + cart_item.item.price
    end
    @order.total_price = (total_price*1.1).floor
    session[:order] = @order
    redirect_to check_orders_path
  end

  def complete

  end

  def create
    cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.save
    cart_items.each do |cart_item|
      order_item = OrderItem.new
      order_item.order_id = @order.id
      order_item.item_id = cart_item.item.id
      order_item.quantity = cart_item.quantity
      order_item.price = cart_item.item.price*1.1
      order_item.save
    end
    if session[:address]
      address = Address.new(session[:address])
      address.save
    end
    session.delete(:order)
    session.delete(:address)
    cart_items.destroy_all
    redirect_to complete_orders_path
  end


  def index
    @orders = current_customer.orders.all.order(id: 'DESC')
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name, :status, :customer_id, :postage, :total_price)
  end

end
