class SeasonCloth < ApplicationRecord
  has_many :cloth
  has_many :season
end
