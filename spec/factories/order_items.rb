FactoryBot.define do
  factory :order_item do
    amount { 3 }
    price { 1000 }
    order_item_status { 0 }
    order_id { 1 }
    item_id { 1 }
  end
end