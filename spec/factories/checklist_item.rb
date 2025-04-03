FactoryBot.define do
  factory :checklist_item do
    sequence(:name) { |n| "アイテム名#{n}" }
    association :checklist
  end
end
