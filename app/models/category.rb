class Category < ApplicationRecord
  validates :name, presence: true

  has_many :category_cloths, dependent: :destroy
  has_many :cloths, through: :category_cloths
  has_many :category_seasons, dependent: :destroy
  has_many :seasons, through: :category_seasons

  has_ancestry

  def self.ransackable_associations(auth_object = nil)
    [ "cloths" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "id" ]
  end
end
