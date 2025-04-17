class RemoveChecklistIdFromChecklist < ActiveRecord::Migration[7.2]
  def change
    remove_index :checklist_items, :checklist_id
    remove_column :checklist_items, :checklist_id
  end
end
