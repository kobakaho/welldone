class Cloth < ApplicationRecord
  mount_uploader :image_file, ClothImageUploader
  include Discard::Model

  validates :brand, presence: true, allow_blank: true, length: { maximum: 50 }
  validates :body, presence: true, allow_blank: true, length: { maximum: 65_535 }
  validates :purchase_date, presence: true, allow_blank: true, comparison: { less_than_or_equal_to: Date.today }# comparison:比較
  validates :price, presence: true, allow_nil: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 }
  validates :season_ids, presence: true
  validates :category_ids, presence: true

  belongs_to :user

  has_many :season_cloths, dependent: :destroy
  has_many :seasons, through: :season_cloths
  has_many :category_cloths, dependent: :destroy
  has_many :categories, through: :category_cloths
  has_many :favorites, dependent: :destroy

  def self.ransackable_associations(auth_object = nil)
    [ "seasons", "categories" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "id", "brand", "body", "purchase_date", "price" ]
  end
end
