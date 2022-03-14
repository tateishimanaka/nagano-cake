FactoryBot.define do
  factory :admin do
    email { 'naganocake@admin.com' }
    password { 'aaaaaa' }
    password_confirmation { 'aaaaaa'}
  end
end