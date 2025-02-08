class Season < ApplicationRecord
  has_many :season_cloths, dependent: :destroy
  has_many :cloths, through: :season_cloths
end
