class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy 
  has_many :order_details
  belongs_to :genre
  has_one_attached :item_image



  def add_tax_price
    (price * 1.10).round
  end

end
