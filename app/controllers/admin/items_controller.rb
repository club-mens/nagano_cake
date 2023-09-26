class Admin::ItemsController < ApplicationController
  #before_action :authenticate_admin!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.genre_id = 1
    if @item.item_image.attach(params[:item][:item_image]) && @item.save
      redirect_to admin_items_path
    else
      @genres = Genre.all
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path
    else
      render :edit
    end
  end


private
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :is_sale, :item_image, :genre_id)
  end
end
