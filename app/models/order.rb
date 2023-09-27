class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer

  has_many :items, through: :order_details

  validates :total_price, presence:true
  validates :postage, presence:true
  validates :payment_method, presence:true
  validates :post_code, presence:true, numericality: {only_integer: true}
  validates :address, presence:true
  validates :name, presence:true

  enum status: {
  waiting_for_payment: 0,
  confirmred_payment: 1,
  maiking: 2,
  shipping_preparation: 3,
  shipping: 4
  }

  enum payment_method: {
    transfer: 0,
    credit_card: 1
  }

  def order_address_display
    post_code + address + name
  end


end
