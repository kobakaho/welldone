FactoryBot.define do
  factory :season do
    sequence(:name) { |n| "name_#{n}" }
  end
end
