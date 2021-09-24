class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting_for_payment: 0, confirm: 1, make: 2, ready_to_ship: 3, finish: 4 }
end
