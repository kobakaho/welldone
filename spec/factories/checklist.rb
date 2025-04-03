FactoryBot.define do
  factory :checklist do
    title { Faker::String.random }
    association :user
  end
end
