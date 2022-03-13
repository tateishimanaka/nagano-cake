FactoryBot.define do
  factory :address do
    name { Faker::Lorem.characters(number: 4) }
    postal_code { Faker::Lorem.characters(number: 7) }
    address { Faker::Lorem.characters(number: 5) }
    customer_id { 1 }
  end
end