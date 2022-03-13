FactoryBot.define do
  factory :order do
    postal_code { Faker::Lorem.characters(number: 7) }
    address { Faker::Lorem.characters(number: 5) }
    name { Faker::Lorem.characters(number: 4) }
    postage { 800 }
    total_price { Faker::Number.between(from: 450, to: 5000) }
    payment_method { 0 }
    order_status { 0 }
    customer_id { 1 }
  end
end