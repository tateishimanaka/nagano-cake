class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum order_item_status: { impossible: 0, stay: 1, make: 2, finish: 3 }
end
 