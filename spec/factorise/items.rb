FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters }
    price { Faker::Number.number }
    introduction { Faker::Lorem.characters }
    is_active { Faker::Boolean.boolean(true_ratio: 0.2) }
  end
end