class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :price, presence:true
  validates :amount, presence:true

  enum making_status: {
    not_making: 0,
    pending: 1,
    making: 2,
    maked: 3
  }
end
