class SeasonCloth < ApplicationRecord
  validates :season_id, uniqueness: { scope: :cloth_id }

  belongs_to :cloth
  belongs_to :season
end
