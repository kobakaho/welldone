class Checklist < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :default_item_checklists, dependent: :destroy
  has_many :default_items, through: :default_item_checklists
  has_many :original_item_checklists, dependent: :destroy
  has_many :original_items, through: :original_item_checklists

  belongs_to :user
end
