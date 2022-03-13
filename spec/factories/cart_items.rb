FactoryBot.define do
  factory :cart_item do
    amount { Faker::Number.between(from: 1, to: 10) }
    item_id { 1 }
    customer_id { 1 }
  end
end