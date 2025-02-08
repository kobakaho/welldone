class Cloth < ApplicationRecord
  validates :brand, allow_blank: true, length: { maximum: 50 }
  validates :body, allow_blank: true, length: { maximum: 65_535 }
  validates :purchase_date, allow_blank: true, comparison: { less_than_or_equal_to: Date.today }# comparison:比較
  validates :price, allow_nil: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 }
  validates :season_ids, presence: true
  validates :category_id, presence: true
  belongs_to :user
  has_many :season_cloths, dependent: :destroy
  has_many :seasons, through: :season_cloths
  has_many :category_cloths, dependent: :destroy
  has_many :categories, through: :category_cloths
end
