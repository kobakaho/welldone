class DefaultItemChecklist < ApplicationRecord
  validates :default_item_id, uniqueness: { scope: :checklist_id }

  belongs_to :checklist
  belongs_to :default_item
end
