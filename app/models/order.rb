class Order < ApplicationRecord
  has_many :order_detail
  belongs_to :customer

  has_many :items, through: :order_details

  validates :total_price, presence:true
  validates :shipping_fee, presence:true
  validates :payment_method, presence:true
  validates :postal_code, presence:true, numericality: {only_integer: true}
  validates :shipping_address, presence:true
  validates :name, presence:true

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
