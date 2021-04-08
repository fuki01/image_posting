FactoryBot.define do
  factory :comment do
    body { "sample text" }
    association :user
    association :context
  end
end
