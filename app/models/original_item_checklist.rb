class OriginalItemChecklist < ApplicationRecord
  validates :original_item_id, uniqueness: { scope: :checklist_id }

  belongs_to :checklist
  belongs_to :original_item
end
