FactoryBot.define do
  factory :user do
    username { "hiro" }
    sequence(:email) { |n| "hiro#{n}@example.com" }
    password { "password" }
  end
end
