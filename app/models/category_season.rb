class CategorySeason < ApplicationRecord
  validates :category_id, uniqueness: { scope: :season_id }

  belongs_to :season
  belongs_to :category    
end
