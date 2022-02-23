FactoryBot.define do
  factory :customer do
    email { Faker::Internet.email }
    password { 'password' }
    last_name { Faker::Lorem.characters(number: 2) }
    first_name { Faker::Name.first_name }
    last_name_kana { Faker::Name.last_name_kana }
    first_name_kana { Faker::Name.first_name_kana }
    postal_code { Faker::Address.postcode }
    address { Faker::Address.full_address }
    telephone_number { Faker::Number.number }
    is_deleted { Faker::Boolean.boolean(true_ratio: 0.2) }
  end
end