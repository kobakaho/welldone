class ChecklistItem < ApplicationRecord
  validates :name, presence: true

  belongs_to :checklist
end
