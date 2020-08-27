FactoryBot.define do
  factory :answer do
    body { "MyText" }
    question

    trait :invalid do
      title { nil }
    end
  end
end
