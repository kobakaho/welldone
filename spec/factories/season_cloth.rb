FactoryBot.define do
  factory :season_cloth do
    association :cloth
    association :season
  end
end
