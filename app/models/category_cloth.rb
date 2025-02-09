class CategoryCloth < ApplicationRecord
  validates :category_id, uniqueness: { scope: :cloth_id }

  belongs_to :cloth
  belongs_to :category
end
