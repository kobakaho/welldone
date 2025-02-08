class Category < ApplicationRecord
  validates :name, presence: true

  has_many :category_cloths, dependent: :destroy
  has_many :cloths, through: :category_cloths
end
