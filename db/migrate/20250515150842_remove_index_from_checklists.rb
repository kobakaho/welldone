class RemoveIndexFromChecklists < ActiveRecord::Migration[7.2]
  def change
    remove_index :checklists, name: "index_checklists_on_title"
  end
end
