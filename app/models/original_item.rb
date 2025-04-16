class OriginalItem < ApplicationRecord
  validates :name,  presence: true

  has_many :original_item_checklists, dependent: :destroy
  has_many :checklists, through: :original_item_checklists
end
