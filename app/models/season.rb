class Season < ApplicationRecord
  validates :name, presence: true

  has_many :season_cloths, dependent: :destroy
  has_many :cloths, through: :season_cloths

  def self.ransackable_associations(auth_object = nil)
    ["cloths"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
