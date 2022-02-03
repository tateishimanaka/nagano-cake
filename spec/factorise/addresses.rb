FactoryBot.define do
  factory :address do
    name { Faker::Lorem.characters }
    postal_code { Faker::Address.postcode }
    address { Faker::Address.full_address }
  end
end