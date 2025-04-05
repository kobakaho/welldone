FactoryBot.define do
  factory :checklist do
    sequence(:title) { |n| "title_#{n}" }
    association :user
  end
end
