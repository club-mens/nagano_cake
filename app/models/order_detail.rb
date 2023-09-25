class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: {
    not_making: 0,
    pending: 1,
    making: 2,
    maked: 3
  }
end
