class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validates :price, presence: true
  validates :making_status, presence: true
  
  enum making_status: {
    着手不可: 0,
    制作待ち: 1,
    製作中: 2,
    制作完了: 3
  }
end
