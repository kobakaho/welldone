class Season < ApplicationRecord
  validates :name, presence: true

  has_many :season_cloths, dependent: :destroy
  has_many :cloths, through: :season_cloths
  has_many :category_seasons, dependent: :destroy
  has_many :categories, through: :category_seasons

  def self.ransackable_associations(auth_object = nil)
    [ "cloths" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "id" ]
  end
end
