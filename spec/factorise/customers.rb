FactoryBot.define do
  factory :customer do
    email { Faker::Internet.email }
    passward { "111111" }
    last_name { "有村" }
    first_name { "架純" }
    last_name_kana { "アリムラ" }
    first_name_kana { "カスミ" }
    postal_code { "1234567" }
    address { "兵庫" }
    telephone_number { "0300998877" }
    # password { 'password' }
    # last_name { Faker::Lorem.characters(number: 2) }
    # first_name { Faker::Lorem.characters(number: 2) }
    # last_name_kana { Faker::Lorem.characters(number: 3) }
    # first_name_kana { Faker::Lorem.characters(number: 3) }
    # postal_code { Faker::Lorem.characters(numnber: 7) }
    # address { Faker::Lorem.characters(number: 5) }
    # telephone_number { Faker::characters(number: 10) }
    is_deleted { "false" }
  end
end