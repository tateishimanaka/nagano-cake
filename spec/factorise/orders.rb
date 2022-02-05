FactoryBot.define do
  factory :order do
    postal_code { Faker::Address.postcode }
    address { Faker::Address.full_address }
    name { Faker::Lorem.characters }
    postage Faker::Number.number(digits: 3) #=> 800
    total_price { Faker::Number.number }
    payment_method { 0 }
    order_status { 0 }
  end
end