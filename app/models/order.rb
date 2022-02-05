class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { stay: 0, confirm: 1, make: 2, ready_to_ship: 3, finish: 4 }
0
  def total
    total_price + postage
  end

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :payment_method, presence: true
end
