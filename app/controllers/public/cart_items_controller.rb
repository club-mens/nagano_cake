class Public::CartItemsController < ApplicationController
  before_action :authenticate_public

  def index
    if current_custmer
      
    end
  end

  def update

  end

  def destroy

  end

  def destroy_all

  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.end_user_id = current_end_used.id
    car_item.item_id = cart_item_params[:item_id]
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = CartItem.find_id(item_id: params[:car_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.update(amount: cart_item.amount)
      redirect_to cart_items_path
    else
      cart_item.save
      redirect_to cart_items_path
    end
  end

private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :item_image)
  end
end
