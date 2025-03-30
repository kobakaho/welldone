FactoryBot.define do
  factory :cloth do
    brand { "ユニクロ" }
    body { "毎年着古すから" }
    purchase_date { Date.new(2025, 3, 1) }
    price { 3000 }

    image_file { Rack::Test::UploadedFile.new(Rails.root.join("spec/support/test_image.png"), "image/png") }

    association :user

    after(:build) do |cloth|
      cloth.seasons << FactoryBot.build(:season)
      cloth.categories << FactoryBot.build(:category)
    end
  end
end
