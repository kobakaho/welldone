FactoryBot.define do
  factory :season do
    name { Faker::Commerce.department }
  end
end
