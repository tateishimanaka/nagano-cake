FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(number: 10) }
    image_id { Faker::Lorem.characters(number: 8) }
    introduction { Faker::Lorem.characters(number: 20) }
    price { 599 }
    is_active { "true" }
    genre_id { 1 }
  end
end