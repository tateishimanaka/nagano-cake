class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def subtotal
    item.add_tax_price * amount
  end

  enum order_item_status: { impossible: 0, stay: 1, make: 2, finish: 3 }
end
