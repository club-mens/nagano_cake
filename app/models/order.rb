class Order < ApplicationRecord
  has_many :order_detail
  belongs_to :customer

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


end
