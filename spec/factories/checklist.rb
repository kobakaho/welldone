FactoryBot.define do
  factory :checklist do
    sequence(:title) { |n| "タイトル名#{n}" }
    association :user
  end
end
