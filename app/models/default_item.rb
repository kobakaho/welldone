class DefaultItem < ApplicationRecord
  validates :name,  presence: true

  has_many :default_item_checklists, dependent: :destroy
  has_many :checklists, through: :default_item_checklists

end
