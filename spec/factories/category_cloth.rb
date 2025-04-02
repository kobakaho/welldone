FactoryBot.define do
  factory :category_cloth do
    association :cloth
    association :category
  end
end
