FactoryBot.define do
  factory :address do
    name { "有村架純" }
    postal_code { "1112222" }
    address { "兵庫県" }
    # name { Faker::Lorem.characters(number: 2) }
    # postal_code { Faker::Lorem.characters(number: 7) }
    # address { Faker::Lorem.characters(number: 5) }
    custmer_id { "1" }
  end
end