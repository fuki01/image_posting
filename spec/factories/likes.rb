FactoryBot.define do
  factory :like do
    association :user
    association :context
  end
end
