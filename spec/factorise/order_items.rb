FactoryBot.define do
  factory :order_item do
    amount { Faker::Number.between(from: 1, to: 10) }
    price { Faker::Number.number }
    order_item_status { 0 }
  end
end