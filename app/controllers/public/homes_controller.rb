class Public::HomesController < ApplicationController

  def top
    @items = Item.all
    @items = Item.order('id ASC').limit(3)
  end

  def about
  end

end
