FactoryBot.define do
  factory :order_item do
    amount { Faker::Number.between(from: 1, to: 10) }
    price { Faker::Lorem.charcters(number: 3) }
    order_item_status { 0 }
    order_id { 1 }
    item_id { 1 }
  end
end