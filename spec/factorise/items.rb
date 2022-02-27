FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(number: 5) }
    introduction { Faker::Lorem.characters(number: 5) }
    price { Faker::Lorem.characters(number: 3) }
    is_active { true }
    image_id { "MyString" }
    genre_id { 1 }
  end
end