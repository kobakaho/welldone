FactoryBot.define do
  factory :cloth do
    brand { "ユニクロ" }
    body { "Sample text" }
    purchase_date { Date.new(2025, 3, 1) }
    price { 3000 }

    image_file { Rack::Test::UploadedFile.new(Rails.root.join("spec/support/test_image.png"), "image/png") }

    association :user

    after(:build) do |cloth|
      cloth.season_ids << FactoryBot.build(:season)
      cloth.category_ids << FactoryBot.build(:category)
    end
  end
end
