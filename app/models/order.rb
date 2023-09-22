class Order < ApplicationRecord
  has_many :order_detail
  belongs_to :customer
  
  enum status: {
  入金待ち: 0,
  入金確認: 1,
  製作中: 2,
  発送準備中: 3,
  発送済み: 4
  }
  
  enum payment_method: {
    銀行: 0,
    クレジットカード: 1
  }


end
