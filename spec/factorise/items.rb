FactoryBot.define do
  factory :item do
    genre_id { 1 }
    name { "MyString" }
    introduction { "MyText" }
    price { 1 }
    image_id { "MyString" }
    is_active { true }
    # name { Faker::Lorem.characters }
    # price { Faker::Number.number }
    # introduction { Faker::Lorem.characters }
    # is_active { Faker::Boolean.boolean(true_ratio: 0.2) }
  end
end